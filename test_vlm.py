import math
import numpy as np
import torch
import torchvision.transforms as T
# from decord import VideoReader, cpu  # Removed - not needed for image processing
from PIL import Image
from torchvision.transforms.functional import InterpolationMode
from transformers import AutoModel, AutoTokenizer, AutoConfig
import sys

IMAGENET_MEAN = (0.485, 0.456, 0.406)
IMAGENET_STD = (0.229, 0.224, 0.225)

def build_transform(input_size):
    MEAN, STD = IMAGENET_MEAN, IMAGENET_STD
    transform = T.Compose([
        T.Lambda(lambda img: img.convert('RGB') if img.mode != 'RGB' else img),
        T.Resize((input_size, input_size), interpolation=InterpolationMode.BICUBIC),
        T.ToTensor(),
        T.Normalize(mean=MEAN, std=STD)
    ])
    return transform

def find_closest_aspect_ratio(aspect_ratio, target_ratios, width, height, image_size):
    best_ratio_diff = float('inf')
    best_ratio = (1, 1)
    area = width * height
    for ratio in target_ratios:
        target_aspect_ratio = ratio[0] / ratio[1]
        ratio_diff = abs(aspect_ratio - target_aspect_ratio)
        if ratio_diff < best_ratio_diff:
            best_ratio_diff = ratio_diff
            best_ratio = ratio
        elif ratio_diff == best_ratio_diff:
            if area > 0.5 * image_size * image_size * ratio[0] * ratio[1]:
                best_ratio = ratio
    return best_ratio

def dynamic_preprocess(image, min_num=1, max_num=12, image_size=448, use_thumbnail=False):
    orig_width, orig_height = image.size
    aspect_ratio = orig_width / orig_height

    # calculate the existing image aspect ratio
    target_ratios = set(
        (i, j) for n in range(min_num, max_num + 1) for i in range(1, n + 1) for j in range(1, n + 1) if
        i * j <= max_num and i * j >= min_num)
    target_ratios = sorted(target_ratios, key=lambda x: x[0] * x[1])

    # find the closest aspect ratio to the target
    target_aspect_ratio = find_closest_aspect_ratio(
        aspect_ratio, target_ratios, orig_width, orig_height, image_size)

    # calculate the target width and height
    target_width = image_size * target_aspect_ratio[0]
    target_height = image_size * target_aspect_ratio[1]
    blocks = target_aspect_ratio[0] * target_aspect_ratio[1]

    # resize the image
    resized_img = image.resize((target_width, target_height))
    processed_images = []
    for i in range(blocks):
        box = (
            (i % (target_width // image_size)) * image_size,
            (i // (target_width // image_size)) * image_size,
            ((i % (target_width // image_size)) + 1) * image_size,
            ((i // (target_width // image_size)) + 1) * image_size
        )
        # split the image
        split_img = resized_img.crop(box)
        processed_images.append(split_img)
    assert len(processed_images) == blocks
    if use_thumbnail and len(processed_images) != 1:
        thumbnail_img = image.resize((image_size, image_size))
        processed_images.append(thumbnail_img)
    return processed_images

def load_image(image_file, input_size=448, max_num=12):
    image = Image.open(image_file).convert('RGB')
    transform = build_transform(input_size=input_size)
    images = dynamic_preprocess(image, image_size=input_size, use_thumbnail=True, max_num=max_num)
    pixel_values = [transform(image) for image in images]
    pixel_values = torch.stack(pixel_values)
    return pixel_values

def split_model(model_name):
    device_map = {}
    world_size = torch.cuda.device_count()
    config = AutoConfig.from_pretrained(model_name, trust_remote_code=True)
    num_layers = config.llm_config.num_hidden_layers
    # Since the first GPU will be used for ViT, treat it as half a GPU.
    num_layers_per_gpu = math.ceil(num_layers / (world_size - 0.5))
    num_layers_per_gpu = [num_layers_per_gpu] * world_size
    num_layers_per_gpu[0] = math.ceil(num_layers_per_gpu[0] * 0.5)
    layer_cnt = 0
    for i, num_layer in enumerate(num_layers_per_gpu):
        for j in range(num_layer):
            device_map[f'language_model.model.layers.{layer_cnt}'] = i
            layer_cnt += 1
    device_map['vision_model'] = 0
    device_map['mlp1'] = 0
    device_map['language_model.model.tok_embeddings'] = 0
    device_map['language_model.model.embed_tokens'] = 0
    device_map['language_model.output'] = 0
    device_map['language_model.model.norm'] = 0
    device_map['language_model.model.rotary_emb'] = 0
    device_map['language_model.lm_head'] = 0
    device_map[f'language_model.model.layers.{num_layers - 1}'] = 0

    return device_map

# If you set `load_in_8bit=True`, you will need two 80GB GPUs.
# If you set `load_in_8bit=False`, you will need at least three 80GB GPUs.
path = 'OpenGVLab/InternVL3-14B'
device_map = split_model(path)
model = AutoModel.from_pretrained(
    path,
    torch_dtype=torch.bfloat16,
    load_in_8bit=False,
    low_cpu_mem_usage=True,
    use_flash_attn=False,  # Set to False since FlashAttention2 is not installed
    trust_remote_code=True,
    device_map=device_map).eval()
tokenizer = AutoTokenizer.from_pretrained(path, trust_remote_code=True, use_fast=False)

# set the max number of tiles in `max_num`

image_path = "data/blocksworld-real/observations/problem1-1.jpg"
pixel_values = load_image(image_path, max_num=12).to(torch.bfloat16).cuda()

# First, do a simple chat without return_dict_in_generate for the initial response
generation_config = dict(max_new_tokens=1024, do_sample=True)

# single-image single-round conversation (单图单轮对话)
question = '<image>\nPlease describe the image shortly.'
response = model.chat(tokenizer, pixel_values, question, generation_config)
print(f'User: {question}\nAssistant: {response}')

# Now, for cache extraction, we'll use the generate method directly
# Manually prepare inputs like chat() does  
sys.path.append('InternVL')
try:
    from internvl_chat.conversation import get_conv_template
    
    template = get_conv_template(model.template)  
    template.system_message = model.system_message  
    template.append_message(template.roles[0], question)  
    template.append_message(template.roles[1], None)  
    query = template.get_prompt()  
except ImportError:
    # Fallback if InternVL is not cloned
    query = f"{model.system_message}\nUser: {question}\nAssistant:"
  
# Replace image tokens  
IMG_START_TOKEN = '<img>'  
IMG_END_TOKEN = '</img>'  
IMG_CONTEXT_TOKEN = '<IMG_CONTEXT>'  
num_patches = pixel_values.shape[0]  
image_tokens = IMG_START_TOKEN + IMG_CONTEXT_TOKEN * model.num_image_token * num_patches + IMG_END_TOKEN  
query = query.replace('<image>', image_tokens, 1)  

# Tokenize and generate  
model_inputs = tokenizer(query, return_tensors='pt')  
input_ids = model_inputs['input_ids'].cuda()  
attention_mask = model_inputs['attention_mask'].cuda()  

# Generation config for getting cache
generation_config_with_cache = dict(
    max_new_tokens=50,
    do_sample=False,
    return_dict_in_generate=True,  # Return full output dict
    output_hidden_states=False,
    output_attentions=False
)
  
# Generate with cache extraction  
outputs = model.generate(  
    pixel_values=pixel_values,  
    input_ids=input_ids,  
    attention_mask=attention_mask,  
    **generation_config_with_cache  
)  
  
# Extract both response and cache  
shared_cache = outputs.past_key_values  
response = tokenizer.decode(outputs.sequences[0][input_ids.shape[1]:], skip_special_tokens=True)  
print(f'\nManual generation with cache:')
print(f'User: {question}\nAssistant: {response}')
print(f'Cache shape: {len(shared_cache)} layers' if shared_cache else 'No cache returned')

# Example of how to use the cache for follow-up questions
if shared_cache:
    print("\n--- Testing cache reuse for follow-up questions ---")
    
    # Prepare a follow-up question
    follow_up = "What is the primary color in the image?"
    
    # Create new input with the previous response and new question
    template.append_message(template.roles[1], response)
    template.append_message(template.roles[0], follow_up)
    template.append_message(template.roles[1], None)
    new_query = template.get_prompt()
    
    # Tokenize the new query
    new_inputs = tokenizer(new_query, return_tensors='pt')
    new_input_ids = new_inputs['input_ids'].cuda()
    new_attention_mask = new_inputs['attention_mask'].cuda()
    
    # Generate using the cached key-values
    follow_up_outputs = model.generate(
        pixel_values=pixel_values,
        input_ids=new_input_ids,
        attention_mask=new_attention_mask,
        past_key_values=shared_cache,  # Reuse the cache
        max_new_tokens=50,
        do_sample=False,
        use_cache=True
    )
    
    follow_up_response = tokenizer.decode(
        follow_up_outputs[0][new_input_ids.shape[1]:], 
        skip_special_tokens=True
    )
    print(f'Follow-up: {follow_up}\nAssistant: {follow_up_response}')

