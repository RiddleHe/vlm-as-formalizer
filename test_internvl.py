import os
import torch
from PIL import Image
from transformers import AutoModel, AutoTokenizer

def create_dummy_image(path="dummy_image.jpg"):
    """Creates a simple red image for testing if it doesn't exist."""
    if not os.path.exists(path):
        print(f"Creating a dummy image at: {path}")
        try:
            img = Image.new('RGB', (224, 224), color='red')
            img.save(path)
        except Exception as e:
            print(f"Error creating dummy image: {e}")
            return None
    return path

def run_internvl_test():
    """
    Loads the InternVL3-14B model and runs inference on a test image.
    """
    # 1. Set Model Path and Device
    model_path = "OpenGVLab/InternVL3-14B"
    device = "cuda" if torch.cuda.is_available() else "cpu"
    print(f"Using device: {device}")

    if device == "cpu":
        print("Warning: Running this large model on a CPU will be very slow and may lead to out-of-memory errors.")

    # 2. Load Model and Tokenizer
    try:
        print(f"Loading model: {model_path}...")
        # For Flash Attention 2, add `use_flash_attn=True`. This requires a compatible GPU setup.
        model = AutoModel.from_pretrained(
            model_path,
            torch_dtype=torch.bfloat16,
            low_cpu_mem_usage=True,
            trust_remote_code=True
        ).eval().to(device)

        tokenizer = AutoTokenizer.from_pretrained(
            model_path,
            trust_remote_code=True
        )
        print("Model and tokenizer loaded successfully.")
    except Exception as e:
        print(f"Failed to load the model. Please ensure dependencies are installed. Error: {e}")
        return

    # 3. Prepare Image and Prompt
    image_path = create_dummy_image()
    if not image_path:
        return
        
    image = Image.open(image_path).convert("RGB")
    prompt = "Describe this image in detail. What color is it?"

    # 4. Run Inference
    try:
        print("Running inference...")
        # The model.chat method is specific to InternVL and handles the conversation logic
        response, history = model.chat(
            tokenizer,
            image,
            prompt,
            history=None
        )
        print("\n--- Model Response ---")
        print(response)
        print("----------------------\n")
    except Exception as e:
        print(f"An error occurred during inference: {e}")

if __name__ == "__main__":
    run_internvl_test() 