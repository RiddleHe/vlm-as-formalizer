import os
import torch
from PIL import Image
from transformers import AutoModel, AutoTokenizer
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
    pixel_values = model.image_processor(images=[image], return_tensors='pt')['pixel_values'].to(torch.bfloat16).to(device)
    inputs = tokenizer.apply_chat_template(messages, add_generation_prompt=True, return_tensors="pt").to(device)

    print("\n--- Generating initial response (shared context) ---")
    try:
        # Generate the first part and explicitly request the cache
        outputs = model.generate(
            input_ids=inputs,
            pixel_values=pixel_values,
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

    # 4. Branch into Parallel Generations from the SAME Shared History
    prompt_variations = [
        "What is the primary color?",
        "Are there any objects in the image?",
        "What could this image be used for?"
    ]

    print("--- Branching from shared context with different prompts ---\n")
    for i, prompt in enumerate(prompt_variations):
        print(f"Branch {i+1}: \"{prompt}\"")
        try:
            # Each branch uses the SAME shared_cache.
            # We build the full conversation history for this branch.
            new_messages = messages + [
                {"role": "assistant", "content": initial_response_text},
                {"role": "user", "content": prompt}
            ]
            branch_inputs = tokenizer.apply_chat_template(new_messages, add_generation_prompt=True, return_tensors="pt").to(device)
            
            # Continue generation from the shared cache state.
            # Note: We pass the image (pixel_values) again, but provide the cache.
            # The model is smart enough to use the cache and not re-process the initial context.
            branch_outputs = model.generate(
                input_ids=branch_inputs,
                pixel_values=pixel_values,
                past_key_values=shared_cache, # <<< Reusing the "same vector" state
                max_new_tokens=100,
                return_dict_in_generate=True,
                do_sample=True,
                temperature=0.7,
                pad_token_id=tokenizer.eos_token_id
            )
            
            # Decode only the newly generated part for this branch
            response_text = tokenizer.decode(branch_outputs.sequences[0][branch_inputs.shape[1]:], skip_special_tokens=True)
            print(f"Response: {response_text}\n")
        except Exception as e:
            print(f"Failed during branch generation: {e}\n")

if __name__ == "__main__":
    run_internvl_cache_test() 