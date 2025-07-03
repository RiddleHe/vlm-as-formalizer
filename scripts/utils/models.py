import os
import base64
import torch
from dotenv import load_dotenv
from abc import ABC, abstractmethod
from PIL import Image
import sys

# Load environment variables
load_dotenv()

def get_gpt_client_name(client_name):
    model_mapping = {
        "gpt-4.1": "gpt-4.1-2025-04-14",
        "gpt-4.1-mini": "gpt-4.1-mini-2025-04-14",
        "o3-mini": "o3-mini-2025-01-31",
        "o4-mini": "o4-mini-2025-04-16"
    }
    if client_name in model_mapping:
        return model_mapping[client_name]
    return None

def get_hf_client_name(client_name):
    model_mapping = {
        "qwenvl-7B": "Qwen/Qwen2.5-VL-7B-Instruct",
        "internvl3-14B": "OpenGVLab/InternVL3-14B", 
        "gemma3-12B": "google/gemma-3-12b-it"
    }
    if client_name in model_mapping:
        return model_mapping[client_name]
    return None

class VLMClient(ABC):
    """Abstract Base Class for Vision-Language Model Clients."""
    def __init__(self, client_name, device=None, **kwargs):
        self.client_name = client_name
        self.device = device
        self.client = self.load_client(**kwargs)
        print(f"Loaded client for: {self.client_name}")

    @abstractmethod
    def load_client(self, **kwargs):
        """Loads the actual client object."""
        pass

    @abstractmethod
    def generate(self, prompt: str, observations: list[str]) -> str:
        """Generates a response from the model."""
        pass

    def _encode_images(self, observations: list[str]) -> list[str]:
        """Encodes a list of image paths to base64 strings."""
        base64_images = []
        for observation in observations:
            with open(observation, "rb") as image_file:
                base64_image = base64.b64encode(image_file.read()).decode("utf-8")
                base64_images.append(base64_image)
        return base64_images

class OpenAIClient(VLMClient):
    """Client for OpenAI models."""
    def __init__(self, client_name, **kwargs):
        super().__init__(client_name, **kwargs)
        
    def load_client(self, **kwargs):
        from openai import OpenAI
        return OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

    def generate(self, prompt: str, observations: list[str] = []) -> str:
        content = []
        if observations:
            base64_images = self._encode_images(observations)
            for base64_image in base64_images:
                content.append({
                    "type": "image_url",
                    "image_url": {"url": f"data:image/jpeg;base64,{base64_image}"}
                })
        content.append({"type": "text", "text": prompt})

        response = self.client.chat.completions.create(
            model=self.client_name,
            messages=[{
                "role": "user",
                "content": content
            }],
            max_tokens=1024,
        )
        return response.choices[0].message.content

class HuggingFaceClient(VLMClient):
    """Client for Hugging Face open source models (Qwen2.5VL and InternVL)."""
    def __init__(self, client_name, device, **kwargs):
        super().__init__(client_name, device=device, **kwargs)

    def load_client(self, **kwargs):
        if "qwen2.5-vl" in self.client_name.lower() or "qwen2_5" in self.client_name.lower():
            return self._load_qwen2_5_vl(self.device)
        elif "internvl" in self.client_name.lower():
            return self._load_internvl(self.device, **kwargs)
        elif "gemma" in self.client_name.lower():
            return self._load_gemma3(self.device)
        else:
            raise ValueError(f"Unsupported HuggingFace model: {self.client_name}")
    
    def _load_qwen2_5_vl(self, device):
        """Load Qwen2.5VL model and processor."""
        from transformers import Qwen2_5_VLForConditionalGeneration, AutoProcessor
        
        model = Qwen2_5_VLForConditionalGeneration.from_pretrained(
            self.client_name,
            torch_dtype=torch.bfloat16,
            device_map="auto",
            attn_implementation="sdpa"
        )
        processor = AutoProcessor.from_pretrained(self.client_name)
        
        return {"model": model, "processor": processor, "type": "qwen2.5vl"}
    
    def _load_internvl(self, device, **kwargs):
        """Load InternVL model using vlm_utils."""
        from transformers import AutoModel, AutoTokenizer
        # Import vlm_utils functions
        import sys
        import os
        sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
        from vlm_utils import split_internvl_model
        
        # Use device mapping for multi-GPU setups if available
        if torch.cuda.device_count() > 1:
            device_map = split_internvl_model(self.client_name)
        else:
            device_map = device
        
        model = AutoModel.from_pretrained(
            self.client_name,
            torch_dtype=torch.bfloat16,
            low_cpu_mem_usage=True,
            use_flash_attn=kwargs.get("use_flash_attn", False),
            trust_remote_code=True,
            device_map=device_map
        ).eval()
        
        tokenizer = AutoTokenizer.from_pretrained(
            self.client_name,
            trust_remote_code=True,
            use_fast=False
        )
        
        return {"model": model, "tokenizer": tokenizer, "type": "internvl"}
    
    def _load_gemma3(self, device):
        """Load Gemma3 model and processor."""
        from transformers import AutoProcessor, Gemma3ForConditionalGeneration
        
        model = Gemma3ForConditionalGeneration.from_pretrained(
            self.client_name,
            torch_dtype=torch.bfloat16,
            device_map="auto",
            attn_implementation="eager"  # Use eager attention to avoid SDPA alignment issues
        ).eval()
        
        processor = AutoProcessor.from_pretrained(self.client_name)
        
        return {"model": model, "processor": processor, "type": "gemma3"}

    def generate(self, prompt: str, observations: list[str] = []) -> str:
        """Generate response based on model type."""
        model_type = self.client["type"]
        
        if model_type == "qwen2.5vl":
            return self._generate_qwen2_5_vl(prompt, observations)
        elif model_type == "internvl":
            return self._generate_internvl(prompt, observations)
        elif model_type == "gemma3":
            return self._generate_gemma3(prompt, observations)
        else:
            raise ValueError(f"Unknown model type: {model_type}")
    
    def _generate_qwen2_5_vl(self, prompt: str, observations: list[str]) -> str:
        """Generate response using Qwen2.5VL."""
        model = self.client["model"]
        processor = self.client["processor"]
        
        # Prepare messages with images
        content = []
        for obs_path in observations:
            content.append({
                "type": "image",
                "url": obs_path  # For local images, this will be handled by the processor
            })
        content.append({
            "type": "text", 
            "text": prompt
        })
        
        messages = [{
            "role": "user",
            "content": content
        }]
        
        # Process the conversation
        inputs = processor.apply_chat_template(
            messages,
            add_generation_prompt=True,
            tokenize=True,
            return_dict=True,
            return_tensors="pt"
        ).to(model.device)
        
        # Generate response
        with torch.no_grad():
            generated_ids = model.generate(**inputs, max_new_tokens=1024)
        
        # Decode only the new tokens
        generated_ids_trimmed = [
            out_ids[len(in_ids):] for in_ids, out_ids in zip(inputs.input_ids, generated_ids)
        ]
        output_text = processor.batch_decode(
            generated_ids_trimmed, skip_special_tokens=True, clean_up_tokenization_spaces=False
        )
        
        return output_text[0] if output_text else ""
    
    def _generate_internvl(self, prompt: str, observations: list[str]) -> str:
        """Generate response using InternVL with vlm_utils."""
        sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
        from vlm_utils import load_image
        
        model = self.client["model"]
        tokenizer = self.client["tokenizer"]
        
        pixel_values_list = []
        for obs in observations:
            cur_pixel_values = load_image(obs, max_num=12).to(torch.bfloat16)
            pixel_values_list.append(cur_pixel_values)
        pixel_values = torch.cat(pixel_values_list, dim=0)
        if torch.cuda.is_available():
            pixel_values = pixel_values.cuda()
            
        image_prompt = f"{prompt}\n<image>"
        generation_config = dict(max_new_tokens=1024, do_sample=True)
        response = model.chat(tokenizer, pixel_values, image_prompt, generation_config)
            
        return response
    
    def _generate_gemma3(self, prompt: str, observations: list[str]) -> str:
        """Generate response using Gemma3."""
        model = self.client["model"]
        processor = self.client["processor"]
        
        # Prepare messages with system prompt and user content
        content = []
        for obs_path in observations:
            content.append({
                "type": "image", 
                "image": obs_path
            })
        content.append({
            "type": "text", 
            "text": prompt
        })
        
        messages = [
            {
                "role": "system",
                "content": [{"type": "text", "text": "You are a helpful assistant."}]
            },
            {
                "role": "user",
                "content": content
            }
        ]
        
        # Process the conversation
        inputs = processor.apply_chat_template(
            messages,
            add_generation_prompt=True,
            tokenize=True,
            return_dict=True,
            return_tensors="pt"
        ).to(model.device, dtype=torch.bfloat16)
        
        input_len = inputs["input_ids"].shape[-1]
        
        # Generate response
        with torch.inference_mode():
            generation = model.generate(**inputs, max_new_tokens=1024, do_sample=False)
            generation = generation[0][input_len:]
        
        # Decode the response
        decoded = processor.decode(generation, skip_special_tokens=True)
        return decoded

def VLMClientFactory(client_name: str, device=None) -> VLMClient:
    """Factory function to create a VLM client."""
    if get_gpt_client_name(client_name):
        return OpenAIClient(get_gpt_client_name(client_name), device=device)
    elif get_hf_client_name(client_name):
        return HuggingFaceClient(get_hf_client_name(client_name), device=device)
    elif "/" in client_name:
        try:
            return HuggingFaceClient(client_name, device=device)
        except Exception as e:
            raise ValueError(f"Error loading HuggingFace model for name: {client_name}")
    else:
        raise ValueError(f"Unknown model name: {client_name}")


if __name__ == "__main__":  # test any model on a prompt and a single image
    import argparse
    
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Test VLM models with images")
    parser.add_argument("--model", type=str, required=True, 
                       help="Model to test. Options: qwen2.5vl, internvl, gemma3, or full model name")
    parser.add_argument("--image", type=str, default="dummy_image.jpg",
                       help="Path to image file (default: dummy_image.jpg)")
    parser.add_argument("--prompt", type=str, default="Describe the image.",
                       help="Prompt to send to the model")
    parser.add_argument("--device", type=str, default="cuda",
                       help="Device to use (default: cuda)")
    
    args = parser.parse_args()
    
    # Model name mapping
    model_mapping = {
        "qwen2.5vl": "Qwen/Qwen2.5-VL-7B-Instruct",
        "internvl": "OpenGVLab/InternVL3-14B", 
        "gemma3": "google/gemma-3-12b-it"
    }
    
    # Determine model name
    if args.model in model_mapping:
        model_name = model_mapping[args.model]
        model_type = args.model
    else:
        model_name = args.model
        model_type = "custom"
    
    # Create dummy image if it doesn't exist and no custom image provided
    if args.image == "dummy_image.jpg" and not os.path.exists("dummy_image.jpg"):
        try:
            from PIL import Image
            img = Image.new('RGB', (100, 100), color='red')
            img.save('dummy_image.jpg')
            print("Created dummy_image.jpg for testing.")
        except ImportError:
            print("PIL/Pillow is not installed. Cannot create a dummy image.")
            print("Please create a file named 'dummy_image.jpg' to run the test.")
            exit(1)
    
    # Check if image file exists
    if not os.path.exists(args.image):
        print(f"Error: Image file '{args.image}' not found.")
        exit(1)
    
    # Test the specified model
    print(f"Testing {model_type} model: {model_name}")
    print(f"Image: {args.image}")
    print(f"Prompt: {args.prompt}")
    print(f"Device: {args.device}")
    print("-" * 50)
    
    try:
        client = VLMClientFactory(model_name, device=args.device)
        response = client.generate(args.prompt, [args.image])
        print(f"Response: {response}")
    except Exception as e:
        print(f"Error testing {model_type}: {e}")
        import traceback
        traceback.print_exc() 