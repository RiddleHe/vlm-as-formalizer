import torch
from transformers import AutoModel, AutoTokenizer, AutoConfig
import sys
from vlm_utils import load_image, split_internvl_model


# If you set `load_in_8bit=True`, you will need two 80GB GPUs.
# If you set `load_in_8bit=False`, you will need at least three 80GB GPUs.
path = 'OpenGVLab/InternVL3-14B'
device_map = split_internvl_model(path)
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
import sys
sys.path.append('InternVL/internvl_chat')
template = None
try:
    from internvl.conversation import get_conv_template
    
    template = get_conv_template(model.template)  
    template.system_message = model.system_message  
    template.append_message(template.roles[0], question)  
    template.append_message(template.roles[1], None)  
    query = template.get_prompt()  
except (ImportError, AttributeError) as e:
    # Fallback if InternVL is not cloned
    print("\n[Debug] Failed to load conversation template with error:")
    print(e)
    print("\n[Notice] Could not load conversation template. Using basic prompt format for cache generation.")
    query = f"User: {question}\nAssistant:"
  
# Replace image tokens  
IMG_START_TOKEN = '<img>'  
IMG_END_TOKEN = '</img>'  
IMG_CONTEXT_TOKEN = '<IMG_CONTEXT>'  
num_patches = pixel_values.shape[0]  
image_tokens = IMG_START_TOKEN + IMG_CONTEXT_TOKEN * model.num_image_token * num_patches + IMG_END_TOKEN  
query = query.replace('<image>', image_tokens, 1)  

# Debug: Let's see what the query looks like
print(f"\n[Debug] Query being sent to model:")
print(f"Query: {query[:200]}..." if len(query) > 200 else f"Query: {query}")
print(f"[Debug] Number of image patches: {num_patches}")
print(f"[Debug] Image tokens per patch: {model.num_image_token}")

# Tokenize and generate  
model_inputs = tokenizer(query, return_tensors='pt')  
input_ids = model_inputs['input_ids'].cuda()  
attention_mask = model_inputs['attention_mask'].cuda() 
eos_token_id = tokenizer.eos_token_id

print(f"[Debug] Input shape: {input_ids.shape}")
print(f"[Debug] First few tokens: {input_ids[0][:20].tolist()}")

# Check if template was loaded successfully
if template:
    eos_token_id = tokenizer.convert_tokens_to_ids(template.sep.strip())
    print(f"\n[Debug] Template loaded successfully")
    print(f"[Debug] Template separator: '{template.sep}'")
    print(f"[Debug] Template separator stripped: '{template.sep.strip()}'")
    print(f"[Debug] EOS token ID from template: {eos_token_id}")
    print(f"[Debug] Tokenizer's default EOS token ID: {tokenizer.eos_token_id}")
    print(f"[Debug] Tokenizer's pad token ID: {tokenizer.pad_token_id}")
    
    # Let's also check what token this ID corresponds to
    if eos_token_id is not None:
        eos_token = tokenizer.convert_ids_to_tokens([eos_token_id])
        print(f"[Debug] EOS token string: {eos_token}")
else:
    # Fallback EOS token ID
    eos_token_id = tokenizer.eos_token_id
    print(f"[Debug] Template not loaded, using fallback eos_token_id: {eos_token_id}")

# Generation config for getting cache
generation_config_with_cache = dict(
    max_new_tokens=50,
    min_new_tokens=5, 
    do_sample=False,
    return_dict_in_generate=True,  # Return full output dict
    output_hidden_states=False,
    output_attentions=False,
    eos_token_id=eos_token_id,  # Add this!  
    pad_token_id=tokenizer.pad_token_id  
)

print(f"\n[Debug] Generation config: {generation_config_with_cache}")
  
# Generate with cache extraction  
outputs = model.generate(  
    input_ids=input_ids,  
    attention_mask=attention_mask,
    pixel_values=pixel_values,  # Pass pixel_values as keyword arg  # Add num_patches_list for proper image handling
    **generation_config_with_cache  
)  
  
# Extract both response and cache  
shared_cache = outputs.past_key_values  

# Debug: Let's see what actually got generated
print(f"\n[Debug] Output sequence shape: {outputs.sequences.shape}")
print(f"[Debug] Input length: {input_ids.shape[1]}")
print(f"[Debug] Output length: {outputs.sequences.shape[1]}")
print(f"[Debug] New tokens generated: {outputs.sequences.shape[1] - input_ids.shape[1]}")

# Check if the output is shorter than input (which would be wrong)
if outputs.sequences.shape[1] <= input_ids.shape[1]:
    print(f"[Debug] WARNING: Output is not longer than input!")
    print(f"[Debug] Last few output tokens: {outputs.sequences[0][-10:].tolist()}")
    # Try decoding the entire output to see what we got
    full_output = tokenizer.decode(outputs.sequences[0], skip_special_tokens=False)
    print(f"[Debug] Full output (with special tokens): {full_output[-200:]}")

response = tokenizer.decode(outputs.sequences[0][input_ids.shape[1]:], skip_special_tokens=True)  
print(f'\nManual generation with cache:')
print(f'User: {question}\nAssistant: {response}')
print(f'Cache shape: {len(shared_cache)} layers' if shared_cache else 'No cache returned')

# Instead of using model.generate() with pixel_values and cache  
# Use the language model directly for text-only follow-ups  
if shared_cache and template:  
    print("\n--- Testing cache reuse for follow-up questions ---")  
      
    # For cache reuse, we need to append to the existing conversation
    # The cache already contains the processed initial conversation
    
    # Get the cached sequence length from the cache shape
    # Each cache layer has (batch_size, num_heads, sequence_length, head_dim)
    cached_sequence_length = shared_cache[0][0].shape[2] if shared_cache and shared_cache[0] else 0
    print(f"[Debug] Cached sequence length: {cached_sequence_length}")
    
    # Append the response and new question to the template
    template.messages[-1][1] = response  # Set the assistant's response
    template.append_message(template.roles[0], "What is the primary color in the image?")
    template.append_message(template.roles[1], None)
    full_conversation = template.get_prompt()
    
    # Tokenize the full conversation
    full_tokens = tokenizer(full_conversation, return_tensors='pt')
    full_input_ids = full_tokens['input_ids'].cuda()
    
    # Extract only the new tokens (after the cached portion)
    new_input_ids = full_input_ids[:, cached_sequence_length:]
    print(f"[Debug] New input shape: {new_input_ids.shape}")
    
    # Create attention mask for the full sequence (cached + new)
    full_length = cached_sequence_length + new_input_ids.shape[1]
    full_attention_mask = torch.ones((1, full_length), dtype=torch.long, device='cuda')
      
    # Generate using cached state via language model directly  
    try:  
        with torch.no_grad():  
            follow_up_outputs = model.language_model.generate(  
                input_ids=new_input_ids,  
                attention_mask=full_attention_mask,  
                past_key_values=shared_cache,  
                max_new_tokens=50,  
                do_sample=False,  
                pad_token_id=tokenizer.pad_token_id,  
                eos_token_id=eos_token_id  
            )  
          
        follow_up_response = tokenizer.decode(  
            follow_up_outputs[0],   
            skip_special_tokens=True  
        )  
        print(f'Follow-up: {follow_up}\nAssistant: {follow_up_response}')  
          
    except Exception as e:  
        print(f"Cache reuse failed: {e}")  
        import traceback
        traceback.print_exc()
        # Fallback to standard chat without cache  
        fallback_response = model.chat(tokenizer, None, "What is the primary color in the image?", {"max_new_tokens": 50})  
        print(f'Fallback response: {fallback_response}')