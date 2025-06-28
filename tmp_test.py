import numpy as np  
import torch  
import torchvision.transforms as T  
from PIL import Image  
from torchvision.transforms.functional import InterpolationMode  
from transformers import AutoModel, AutoTokenizer  
  
# Constants for image preprocessing  
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
  
# Main code  
def main():  
    # Load model and tokenizer  
    path = "OpenGVLab/InternVL3-14B"

    model = AutoModel.from_pretrained(  
        path,  
        torch_dtype=torch.bfloat16,  
        low_cpu_mem_usage=True,  
        trust_remote_code=True  
    ).eval().cuda()  
      
    tokenizer = AutoTokenizer.from_pretrained(  
        path,   
        trust_remote_code=True,   
        use_fast=False  
    )  
  
    # Load and process image  
    image_path = "data/blocksworld-real/observations/problem1-1.jpg"  
    pixel_values = load_image(image_path, max_num=12).to(torch.bfloat16).cuda()  
      
    # Prepare question  
    question = '<image>\nPlease describe the image explicitly.'  
      
    # Generation config with cache enabled  
    generation_config = dict(  
        max_new_tokens=50,  
        do_sample=False,  
        use_cache=True,  
        return_dict_in_generate=True  
    )  
      
    # Method 1: Using the chat interface (recommended)  
    print("=== Using chat interface ===")  
    response = model.chat(  
        tokenizer=tokenizer,  
        pixel_values=pixel_values,  
        question=question,  
        generation_config=generation_config  
    )  
    print(f"Response: {response}")  
      
    # Method 2: Direct generation with cache extraction  
    print("\n=== Using direct generation with cache ===")  
      
    # First, we need to prepare inputs manually like the chat method does  
    from internvl.conversation import get_conv_template  
      
    # Get conversation template  
    template = get_conv_template(model.template)  
    template.system_message = model.system_message  
    template.append_message(template.roles[0], question)  
    template.append_message(template.roles[1], None)  
    query = template.get_prompt()  
      
    # Replace image tokens  
    IMG_START_TOKEN = '<img>'  
    IMG_END_TOKEN = '</img>'  
    IMG_CONTEXT_TOKEN = '<IMG_CONTEXT>'  
      
    num_patches = pixel_values.shape[0]  
    image_tokens = IMG_START_TOKEN + IMG_CONTEXT_TOKEN * model.num_image_token * num_patches + IMG_END_TOKEN  
    query = query.replace('<image>', image_tokens, 1)  
      
    # Tokenize  
    model_inputs = tokenizer(query, return_tensors='pt')  
    input_ids = model_inputs['input_ids'].cuda()  
    attention_mask = model_inputs['attention_mask'].cuda()  
      
    # Generate with cache  
    generation_config['eos_token_id'] = tokenizer.convert_tokens_to_ids(template.sep.strip())  
      
    outputs = model.generate(  
        pixel_values=pixel_values,  
        input_ids=input_ids,  
        attention_mask=attention_mask,  
        **generation_config  
    )  
      
    # Extract cache and response  
    shared_cache = outputs.past_key_values  
    initial_response_text = tokenizer.decode(  
        outputs.sequences[0][input_ids.shape[1]:],   
        skip_special_tokens=True  
    )  
      
    print(f"Generated text: {initial_response_text}")  
    print(f"Cache type: {type(shared_cache)}")  
    print(f"Cache length (num layers): {len(shared_cache) if shared_cache else 'None'}")  
    if shared_cache:  
        print(f"First layer cache shape: {[x.shape for x in shared_cache[0]]}")  
      
    return shared_cache, initial_response_text  
  
if __name__ == "__main__":  
    shared_cache, response = main()