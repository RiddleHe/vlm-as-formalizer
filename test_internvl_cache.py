import os
import torch
from PIL import Image
from transformers import AutoModel, AutoTokenizer, AutoProcessor
import importlib

def create_dummy_image(path="dummy_image.jpg"):
    """Creates a simple red image for testing if it doesn't exist."""
    if not os.path.exists(path):
        print(f"Creating a dummy image at: {path}")
        img = Image.new('RGB', (224, 224), color='red')
        img.save(path)
    return path

def run_internvl_cache_test():
    """
    Demonstrates branching from a shared conversational context (cache)
    with the InternVL model.
    """
    # 1. Setup
    model_path = "OpenGVLab/InternVL3-14B"
    device = "cuda" if torch.cuda.is_available() else "cpu"
    print(f"Using device: {device}")

    if device == "cpu":
        print("Warning: Running this large model on a CPU is not recommended.")

    # 2. Load Model
    try:
        print(f"Loading model: {model_path}...")
        model = AutoModel.from_pretrained(
            model_path,
            torch_dtype=torch.bfloat16,
            low_cpu_mem_usage=True,
            trust_remote_code=True,
            attn_implementation="eager"  # Use the standard attention mechanism
        ).eval().to(device)
        tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
        processor = AutoProcessor.from_pretrained(model_path)
        print("Model loaded.")
    except Exception as e:
        print(f"Failed to load model. Error: {e}")
        return

    # 3. Initial Generation (Build Shared Context)
    image_path = create_dummy_image()
    image = Image.open(image_path).convert("RGB")
    initial_prompt = "Describe this image in one short sentence."

    # For InternVL, the chat template expects an <image> placeholder.
    # We manually construct the conversation history.
    messages = [{"role": "user", "content": f"<image>\n{initial_prompt}"}]
    
    # Process the image and tokenize the text prompt
    inputs = processor.apply_chat_template(  
    messages,   
    add_generation_prompt=True,   
    return_tensors="pt"  
    ).to(model.device)  

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
        initial_response_text = tokenizer.decode(outputs.sequences[0][inputs.shape[1]:], skip_special_tokens=True)

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
    all_new_messages = []
    for prompt in prompt_variations:
        all_new_messages.append(
            messages + [
                {"role": "assistant", "content": initial_response_text},
                {"role": "user", "content": prompt}
            ]
        )

    # Tokenize all branches at once with padding
    tokenizer.padding_side = 'left' # For generation, use left padding
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    batched_inputs = tokenizer.apply_chat_template(
        all_new_messages, 
        add_generation_prompt=True, 
        return_tensors="pt",
        padding=True
    ).to(device)

    # Replicate the image and cache for each item in the batch
    batch_size = len(prompt_variations)
    batched_pixel_values = pixel_values.expand(batch_size, -1, -1, -1)
    expanded_cache = tuple(
        (
            k.expand(batch_size, -1, -1, -1),
            v.expand(batch_size, -1, -1, -1)
        ) for k, v in shared_cache
    )
    
    # Generate all responses in a single batch
    parallel_outputs = model.generate(
        **batched_inputs,
        pixel_values=batched_pixel_values,
        past_key_values=expanded_cache,
        max_new_tokens=100,
        return_dict_in_generate=True,
        do_sample=True,
        temperature=0.7,
        pad_token_id=tokenizer.eos_token_id # Important for batch generation with padding
    )

    # Decode the outputs
    for i in range(batch_size):
        prompt_len = batched_inputs.input_ids[i].shape[0]
        response_text = tokenizer.decode(parallel_outputs.sequences[i][prompt_len:], skip_special_tokens=True)
        print(f"Branch {i+1} Response for \"{prompt_variations[i]}\":\n{response_text}\n")

if __name__ == "__main__":
    run_internvl_cache_test() 