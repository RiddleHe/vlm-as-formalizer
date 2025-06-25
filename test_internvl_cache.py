import os
import torch
from PIL import Image
from transformers import AutoModel, AutoTokenizer

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
            attn_implementation="flash_attention_2"
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

    print("\n--- Generating initial response (shared context) ---")
    try:
        initial_response, shared_history = model.chat(
            tokenizer, image, initial_prompt, history=None, stream=False
        )
        print(f"Initial Response: {initial_response}")
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
            # Each branch uses the SAME `shared_history` from the initial call
            branch_response, _ = model.chat(
                tokenizer,
                image, # Image still needs to be passed for multimodal context
                prompt,
                history=shared_history,
                stream=False
            )
            print(f"Response: {branch_response}\n")
        except Exception as e:
            print(f"Failed during branch generation: {e}\n")

if __name__ == "__main__":
    run_internvl_cache_test() 