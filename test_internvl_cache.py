import os
import sys
import torch
from PIL import Image
from transformers import AutoModel, AutoTokenizer, AutoProcessor
import importlib

from vlm_utils import load_image, split_internvl_model

def run_internvl_cache_test():
    """
    Demonstrates branching from a shared conversational context (cache)
    with the InternVL model.
    """
    model_path = "OpenGVLab/InternVL3-14B"
    device = "cuda"
    device_map = split_internvl_model(model_path)

    print(f"Loading model: {model_path}...")
    model = AutoModel.from_pretrained(
        model_path,
        torch_dtype=torch.bfloat16,
        low_cpu_mem_usage=True,
        trust_remote_code=True,
        # use_flash_attn=True,
        device_map=device_map,
    ).eval().to(device)
    tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
    processor = AutoProcessor.from_pretrained(model_path, trust_remote_code=True)
    print("Model loaded.")

    sys.exit()

    image_path = "data/blocksworld-real/observations/problem1-1.jpg"
    image = Image.open(image_path).convert("RGB")
    generation_config = dict(max_new_tokens=1024, do_sample=True)
    prompt = "Please describe the image explicitly."
    text = f(
        "<|im_start|>user\n<IMG_CONTEXT>\n{prompt}.<|im_end|>\n<|im_start|>assistant\n"
    )
    inputs = processor(
        images=image, 
        text=text, 
        return_tensors="pt"
    ).to(device, dtype=torch.float16)

    # Use the processor to prepare the inputs for the model.
    # This is the correct way to handle multimodal inputs, as the processor
    # coordinates both the image processor and the tokenizer.
    inputs = processor(
        text=messages,
        images=[image],
        return_tensors="pt",
        add_generation_prompt=True,
    ).to(device)

    print("\n--- Generating initial response (shared context) ---")
    try:
        # Generate the first part and explicitly request the cache
        outputs = model.generate(
            **inputs,
            max_new_tokens=50,
            return_dict_in_generate=True,
            do_sample=False
        )
        # This cache is the "same vector". It holds the model's state.
        shared_cache = outputs.past_key_values
        initial_response_text = tokenizer.decode(outputs.sequences[0][inputs.input_ids.shape[1]:], skip_special_tokens=True)

        print(f"Initial Response: {initial_response_text}")
        print("--------------------------------------------------\n")
    except Exception as e:
        print(f"Failed during initial generation: {e}")
        return

    # 4. Branch into Parallel Generations using BATCHING
    prompt_variations = [
        "What is the primary color?",
        "Are there any objects in the image?",
        "What could this image be used for?"
    ]

    print("--- Branching from shared context with different prompts (in a batch) ---\n")
    
    # Create a list of all conversation branches
    # Prepare all branch inputs at once  
    all_branch_inputs = []  
    for prompt in prompt_variations:  
        new_messages = messages + [  
            {"role": "assistant", "content": tokenizer.decode(outputs.sequences[0][inputs["input_ids"].shape[1]:], skip_special_tokens=True)},  
            {"role": "user", "content": prompt}  
        ]  
        branch_inputs = processor.apply_chat_template(new_messages, add_generation_prompt=True, return_tensors="pt", return_dict=True)  
        all_branch_inputs.append(branch_inputs["input_ids"])  
  
    # Batch all inputs together  
    batched_inputs = torch.cat(all_branch_inputs, dim=0)  
  
    # Replicate the shared cache for batch processing  
    batch_size = len(prompt_variations)  
    batched_cache = shared_cache.batch_repeat_interleave(batch_size)  
  
    # Generate all variations in parallel  
    parallel_outputs = model.generate(  
        **batched_inputs,  
        past_key_values=batched_cache,  
        max_new_tokens=100,  
        return_dict_in_generate=True,  
        do_sample=True,  
        temperature=0.7  
    )
    # Decode the outputs  
    for i, output in enumerate(parallel_outputs):  
        response_text = tokenizer.decode(output.sequences[0][batched_inputs.shape[1]:], skip_special_tokens=True)  
        print(f"Response {i}: {response_text}")  
        print("--------------------------------------------------\n")  
    return

if __name__ == "__main__":
    run_internvl_cache_test() 