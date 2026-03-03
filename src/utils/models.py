import os
import base64
import torch
from dotenv import load_dotenv
from abc import ABC, abstractmethod
from PIL import Image
import sys
import hashlib
import torch.nn.functional as F
import time

# Load environment variables
load_dotenv()

VLLM_BASE_URL = os.getenv("VLLM_BASE_URL", "http://localhost:15100/v1")

def get_gpt_client_name(client_name):
    model_mapping = {
        "gpt-4.1": "gpt-4.1",
        "gpt-4.1-mini": "gpt-4.1-mini",
        "gpt-4o": "gpt-4o",
        "gpt-4o-mini": "gpt-4o-mini",
        "o3-mini": "o3-mini",
        "o4-mini": "o4-mini",
    }
    if client_name in model_mapping:
        return model_mapping[client_name]
    if client_name.startswith(("gpt-", "o1", "o3", "o4")):
        return client_name
    return None

def get_openrouter_client_name(client_name):
    model_mapping = {
        "llama-3.2-90B": "meta-llama/llama-3.2-90b-vision-instruct"
    }
    if client_name in model_mapping:
        return model_mapping[client_name]
    return None

def get_hf_client_name(client_name):
    model_mapping = {
        "qwenvl-7B": "Qwen/Qwen2.5-VL-7B-Instruct",
        "qwenvl-72B": "Qwen/Qwen2.5-VL-72B-Instruct",
        "internvl3-14B": "OpenGVLab/InternVL3-14B", 
        "internvl3-78B": "OpenGVLab/InternVL3-78B",
        "gemma3-12B": "google/gemma-3-12b-it",
        "gemma3-27B": "google/gemma-3-27b-it",
        "llama-3.2-11B": "meta-llama/Llama-3.2-11B-Vision-Instruct"
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
        api_key = os.getenv("OPENAI_API_KEY")
        if not api_key:
            raise ValueError("OPENAI_API_KEY is not set.")
        return OpenAI(api_key=api_key)

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

        # Handle different parameter names for different models
        if self.client_name.startswith(('o3', 'o4', 'gpt-5')):
            # O3 and O4 models use max_completion_tokens instead of max_tokens
            response = self.client.chat.completions.create(
                model=self.client_name,
                messages=[{
                    "role": "user",
                    "content": content
                }],
                max_completion_tokens=1024,
            )
        else:
            # Other models use max_tokens
            response = self.client.chat.completions.create(
                model=self.client_name,
                messages=[{
                    "role": "user",
                    "content": content
                }],
                max_tokens=1024,
        )
        if response and response.choices and response.choices[0].message:
            return response.choices[0].message.content or ""
        return ""

class OpenRouterClient(VLMClient):
    """Client for OpenRouter models (Llama 3.2 Vision)."""
    def __init__(self, client_name, **kwargs):
        super().__init__(client_name, **kwargs)
        
    def load_client(self, **kwargs):
        from openai import OpenAI
        api_key = os.getenv("OPENROUTER_API_KEY")
        if not api_key:
            raise ValueError("OPENROUTER_API_KEY is not set.")
        return OpenAI(
            base_url="https://openrouter.ai/api/v1",
            api_key=api_key
        )

    def generate(self, prompt: str, observations: list[str] = []) -> str:
        if not observations:
            # No images, just text
            content = [{"type": "text", "text": prompt}]
            
        elif len(observations) == 1:
            # Single image - use original format
            content = []
            base64_images = self._encode_images(observations)
            content.append({
                "type": "image_url",
                "image_url": {"url": f"data:image/jpeg;base64,{base64_images[0]}"}
            })
            content.append({"type": "text", "text": prompt})
            
        else:
            # Multiple images - OpenRouter doesn't support this directly
            # So we'll process each image separately and combine results
            print(f"🔄 Processing {len(observations)} images separately for OpenRouter...")
            
            individual_responses = []
            for i, obs in enumerate(observations):
                base64_image = self._encode_images([obs])[0]
                individual_content = [
                    {
                        "type": "image_url",
                        "image_url": {"url": f"data:image/jpeg;base64,{base64_image}"}
                    },
                    {"type": "text", "text": f"Image {i+1}: {prompt}"}
                ]
                
                try:
                    response = self.client.chat.completions.create(
                        model=self.client_name,
                        messages=[{
                            "role": "user",
                            "content": individual_content
                        }],
                        max_tokens=1024,
                    )
                    
                    if response and response.choices and response.choices[0].message:
                        individual_responses.append(f"Image {i+1}: {response.choices[0].message.content}")
                    else:
                        individual_responses.append(f"Image {i+1}: [No response]")
                        
                except Exception as e:
                    print(f"❌ Failed to process image {i+1}: {str(e)}")
                    individual_responses.append(f"Image {i+1}: [Error: {str(e)}]")
            
            # Combine all responses
            return "\n\n".join(individual_responses)

        # Single request for no images or single image
        try:
            response = self.client.chat.completions.create(
                model=self.client_name,
                messages=[{
                    "role": "user",
                    "content": content
                }],
                max_tokens=1024,
            )
            
            if response is None:
                print(f"⚠️ OpenRouter API returned None for model {self.client_name}")
                return ""
            
            if not hasattr(response, 'choices') or not response.choices:
                print(f"⚠️ OpenRouter API response has no choices: {response}")
                return ""
                
            if not response.choices[0].message:
                print(f"⚠️ OpenRouter API response has no message: {response.choices[0]}")
                return ""
                
            return response.choices[0].message.content or ""
            
        except Exception as e:
            print(f"❌ OpenRouter API Error: {str(e)}")
            return ""

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
        elif "llama" in self.client_name.lower():
            return self._load_llama_vision(self.device)
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
            attn_implementation="sdpa" 
        ).eval()
        
        processor = AutoProcessor.from_pretrained(self.client_name, padding_side="left")
        
        return {"model": model, "processor": processor, "type": "gemma3"}

    def _load_llama_vision(self, device):
        """Load Llama Vision model and processor."""
        from transformers import MllamaForConditionalGeneration, AutoProcessor
        hf_token = os.getenv("HF_TOKEN")
        if not hf_token:
            raise ValueError("HF_TOKEN is not set.")
        
        model = MllamaForConditionalGeneration.from_pretrained(
            self.client_name,
            torch_dtype=torch.bfloat16,
            device_map="auto",
            attn_implementation="sdpa",
            token=hf_token
        ).eval()
        
        processor = AutoProcessor.from_pretrained(self.client_name, token=hf_token)
        
        return {"model": model, "processor": processor, "type": "llama_vision"}

    def generate(self, prompt: str, observations: list[str] = [], return_cache=False, past_key_values=None) -> str:
        model_type = self.client["type"]
        if model_type == "qwen2.5vl":
            return self._generate_qwen2_5_vl(prompt, observations)
        if model_type == "internvl":
            return self._generate_internvl(prompt, observations)
        if model_type == "gemma3":
            return self._generate_gemma3(prompt, observations, return_cache=return_cache, past_key_values=past_key_values)
        if model_type == "llama_vision":
            return self._generate_llama_vision(prompt, observations)
            raise ValueError(f"Unknown model type: {model_type}")
    
    def _generate_qwen2_5_vl(self, prompt: str, observations: list[str]):
        model = self.client["model"]
        processor = self.client["processor"]
        content = []
        for obs_path in observations:
            content.append({"type": "image", "url": obs_path})
        content.append({"type": "text", "text": prompt})
        messages = [{"role": "user", "content": content}]
        inputs = processor.apply_chat_template(messages, add_generation_prompt=True, tokenize=True, return_dict=True, return_tensors="pt").to(model.device)
        with torch.no_grad():
            generated_ids = model.generate(**inputs, max_new_tokens=4096)
        generated_ids_trimmed = [out_ids[len(in_ids):] for in_ids, out_ids in zip(inputs.input_ids, generated_ids)]
        output_text = processor.batch_decode(generated_ids_trimmed, skip_special_tokens=True, clean_up_tokenization_spaces=False)
        return output_text[0] if output_text else ""
    
    def _generate_internvl(self, prompt: str, observations: list[str]):
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
        generation_config = dict(max_new_tokens=4096, do_sample=True)
        response = model.chat(tokenizer, pixel_values, image_prompt, generation_config)
        return response
    
    def _generate_gemma3(self, prompt: str, observations: list[str], return_cache=False, past_key_values=None):
        model = self.client["model"]
        processor = self.client["processor"]
        content = []
        for obs_path in observations:
            content.append({"type": "image", "image": obs_path})
        content.append({"type": "text", "text": prompt})
        if past_key_values is not None:
            messages = [{"role": "user", "content": content}]
        else:
            messages = [{"role": "system", "content": [{"type": "text", "text": "You are a helpful assistant."}]}, {"role": "user", "content": content}]
            inputs = processor.apply_chat_template(messages, add_generation_prompt=True, tokenize=True, return_dict=True, return_tensors="pt").to(model.device, dtype=torch.bfloat16)
            input_len = inputs["input_ids"].shape[-1]
        with torch.inference_mode():
            outputs = model.generate(**inputs, max_new_tokens=4096, do_sample=False, top_p=None, top_k=None, use_cache=True, return_dict_in_generate=return_cache, output_attentions=False, output_hidden_states=False, past_key_values=past_key_values)
        if return_cache:
            generation = outputs.sequences[0][input_len:]
            past_key_values = outputs.past_key_values
            decoded = processor.decode(generation, skip_special_tokens=True)
            return decoded, past_key_values
            generation = outputs[0][input_len:]
            decoded = processor.decode(generation, skip_special_tokens=True)
            return decoded

    def _generate_llama_vision(self, prompt: str, observations: list[str]):
        model = self.client["model"]
        processor = self.client["processor"]
        images = [Image.open(obs_path).convert("RGB") for obs_path in observations]
        conversation = [{"role": "user", "content": [{"type": "image", "image": img} for img in images] + [{"type": "text", "text": prompt}]}]
        prompt_text = processor.apply_chat_template(conversation, add_generation_prompt=True)
        inputs = processor(images, prompt_text, return_tensors="pt").to(model.device)
        with torch.inference_mode():
            outputs = model.generate(**inputs, max_new_tokens=4096, do_sample=False, temperature=0.0)
        generated_text = processor.decode(outputs[0], skip_special_tokens=True)
        response = generated_text.split(prompt_text)[-1].strip()
        return response

class VLLMOpenAIClient(OpenAIClient):
    def __init__(self, client_name, base_url=VLLM_BASE_URL, **kwargs):
        self.base_url = base_url
        # Map simplified model names to full HuggingFace model names for vLLM
        mapped_name = get_hf_client_name(client_name)
        if mapped_name:
            client_name = mapped_name
        super().__init__(client_name, **kwargs)

    def load_client(self, **kwargs):
        from openai import OpenAI
        return OpenAI(base_url=self.base_url, api_key="EMPTY")

def VLMClientFactory(client_name: str, device=None) -> VLMClient:
    """Factory function to create a VLM client."""
    if not client_name:
        raise ValueError("Model name cannot be empty.")

    mapped_openai_name = get_gpt_client_name(client_name)
    if mapped_openai_name:
        return OpenAIClient(mapped_openai_name, device=device)

    mapped_openrouter_name = get_openrouter_client_name(client_name)
    if mapped_openrouter_name:
        return OpenRouterClient(mapped_openrouter_name, device=device)

    mapped_hf_name = get_hf_client_name(client_name)
    if mapped_hf_name:
        return HuggingFaceClient(mapped_hf_name, device=device)

    if client_name.endswith("-vllm"):
        base_model = client_name[:-5]
        return VLLMOpenAIClient(base_model)

    if "/" in client_name:
        try:
            return HuggingFaceClient(client_name, device=device)
        except Exception as e:
            raise ValueError(f"Error loading HuggingFace model for name: {client_name}") from e

    raise ValueError(f"Unknown model name: {client_name}")

def predict_relation_probs(model, prompts, observations, past_key_values=None):
    raw_model = model.client["model"]
    raw_model.eval()
    processor = model.client["processor"]

    use_kv_cache = past_key_values is not None

    if model.client["type"] == "gemma3":
        # monkey patch
        cache = {}
        old_get_img_feat = raw_model.get_image_features
        def cached_get_img_feat(pixel_values):  # (batch_size, num_channels, height, width)
            outs = []
            for row in pixel_values:
                key = hashlib.sha1(row.float().cpu().numpy().tobytes()).hexdigest()
                if key not in cache:
                    with torch.no_grad():
                        cache[key] = old_get_img_feat(row.unsqueeze(0))
                outs.append(cache[key])
            return torch.cat(outs, dim=0)
        raw_model.get_image_features = cached_get_img_feat

        chat_prompts = []
        for prompt in prompts:
            content = [
                    {"type": "text", "text": prompt}
                ]
        if not use_kv_cache:
            images_content = []
            images_list = []
            for obs_path in observations:
                img = Image.open(obs_path)
                images_content.append({
                    "type": "image", 
                    "image": img
                })
                images_list.append(img)
            content += images_content

            messages = [
                {
                    "role": "user",
                    "content": content
                },
                {
                    "role": "assistant",
                    "content": [
                        {"type": "text", "text": "Based on the image, the answer is: Yes."}
                    ]
                },
                {
                    "role": "user",
                    "content": [
                        {"type": "text", "text": "To ensure nothing is missing, check again."}
                    ]
                }
            ]
            chat_prompt = processor.apply_chat_template(
                messages,
                add_generation_prompt=True,
            )
            chat_prompts.append(chat_prompt)

        template = "{chat_prompt} You are right to ask me to double-check! My apologies. Looking again, the answer is: "
        full_prompts = [template.format(chat_prompt=chat_prompt) for chat_prompt in chat_prompts]

    if use_kv_cache:
        batch = processor.tokenizer(
            full_prompts,
            return_tensors="pt",
            padding=True,
        ).to(model.device)
    
    else:
        batch = processor(
            images=[images_list for _ in prompts],  # preprocess image and text jointly to trigger <image_soft_tokens>
            text=full_prompts,
            return_tensors="pt",
            padding=True,
            images_kwargs={"do_pan_and_scan": False},  # disable cropping
        ).to(model.device, dtype=torch.bfloat16)

        # Prepare binary classes
        true_tok = processor.tokenizer.convert_tokens_to_ids("yes") # 11262
        false_tok = processor.tokenizer.convert_tokens_to_ids("no") # 951
        assert true_tok != processor.tokenizer.unk_token_id  # unknown token is 3
        assert false_tok != processor.tokenizer.unk_token_id
        candidate = torch.tensor([true_tok, false_tok], device=model.device)

        temperature = 0.5
        with torch.no_grad():
            if use_kv_cache:
                batch_size = batch["input_ids"].shape[0]
                if past_key_values[0][0].shape[0] != batch_size:
                    if model.client["type"] == "gemma3":
                        new_key_cache = [k.expand(batch_size, -1, -1, -1) for k in past_key_values.key_cache]
                        new_value_cache = [v.expand(batch_size, -1, -1, -1) for v in past_key_values.value_cache]
                        past_key_values = HybridCache(key_cache=new_key_cache, value_cache=new_value_cache)
                    else:
                        past_key_values = tuple(
                            (
                                layer_past[0].expand(batch_size, -1, -1, -1),
                                layer_past[1].expand(batch_size, -1, -1, -1),
                            )
                            for layer_past in past_key_values
                        )
                logits = raw_model(
                    input_ids=batch["input_ids"],
                    attention_mask=batch["attention_mask"],
                    past_key_values=past_key_values,
                ).logits[:, -1]
            else:
                logits = raw_model(**batch).logits[:, -1]
            probs = F.softmax(logits[:, candidate] / temperature, dim=-1)

        torch.cuda.synchronize()

        predictions = probs[:, 0] > probs[:, 1]
        predictions = predictions.cpu().numpy().tolist()

        print("--------------------------------")
        print("pred (yes) = ", probs[:, 0].float().cpu().numpy().round(2))
        print("pred (no) = ", probs[:, 1].float().cpu().numpy().round(2))

        return predictions

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
