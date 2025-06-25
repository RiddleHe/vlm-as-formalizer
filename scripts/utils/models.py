import os
import base64
import torch
from dotenv import load_dotenv
from abc import ABC, abstractmethod
import requests
from PIL import Image

# Load environment variables
load_dotenv()

def get_gpt_client_name(client_name):
    if "gpt" in client_name:
        return client_name + "-2025-04-14"
    elif "o3-mini" in client_name:
        return client_name + "-2025-01-31"
    elif "o4-mini" in client_name:
        return client_name + "-2025-04-16"
    return client_name

class VLMClient(ABC):
    """Abstract Base Class for Vision-Language Model Clients."""
    def __init__(self, client_name, **kwargs):
        self.client_name = client_name
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
    def load_client(self, **kwargs):
        from openai import OpenAI
        return OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

    def generate(self, prompt: str, observations: list[str]) -> str:
        base64_images = self._encode_images(observations)
        content = []
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

class OpenRouterClient(VLMClient):
    """Client for OpenRouter models."""
    def load_client(self, **kwargs):
        from openai import OpenAI
        api_key = os.getenv("OPENROUTER_API_KEY")
        if not api_key:
            raise ValueError("OPENROUTER_API_KEY environment variable not set")
        return OpenAI(
            base_url="https://openrouter.ai/api/v1",
            api_key=api_key,
        )

    def generate(self, prompt: str, observations: list[str]) -> str:
        base64_images = self._encode_images(observations)
        content = [{"type": "text", "text": prompt}]
        for base64_image in base64_images:
            content.append({
                "type": "image_url",
                "image_url": {"url": f"data:image/jpeg;base64,{base64_image}"}
            })

        try:
            completion = self.client.chat.completions.create(
                extra_headers={
                    "HTTP-Referer": "https://github.com/your-repo/roboplan",
                    "X-Title": "RoboPlan VLM Testing"
                },
                model=self.client_name,
                messages=[{"role": "user", "content": content}],
                max_tokens=1024,
                temperature=0.7,
            )
            return completion.choices[0].message.content
        except Exception as e:
            raise RuntimeError(f"OpenRouter API request failed: {str(e)}")

class InternVLClient(VLMClient):
    """Client for InternVL models from Hugging Face, which require custom code."""
    def load_client(self, **kwargs):
        from transformers import AutoModel, AutoTokenizer

        model = AutoModel.from_pretrained(
            self.client_name,
            torch_dtype=torch.bfloat16,
            low_cpu_mem_usage=True,
            trust_remote_code=True,
        ).to(kwargs.get("device"))
        
        tokenizer = AutoTokenizer.from_pretrained(
            self.client_name, 
            trust_remote_code=True
        )
        return {"model": model, "tokenizer": tokenizer}

    def generate(self, prompt: str, observations: list[str]) -> str:
        if not observations:
            raise ValueError("InternVLClient requires at least one image.")
        
        images = [Image.open(obs).convert("RGB") for obs in observations]
        image_arg = images[0] if len(images) == 1 else images
        
        # The model.chat method takes tokenizer, image, question, and history
        response, _ = self.client["model"].chat(
            tokenizer=self.client["tokenizer"],
            image=image_arg,
            question=prompt,
            history=None,
            stream=False
        )
        return response

def VLMClientFactory(client_name: str, device=None) -> VLMClient:
    """Factory function to create a VLM client."""
    if any(name in client_name for name in ["gpt", "o3", "o4"]):
        gpt_client_name = get_gpt_client_name(client_name)
        return OpenAIClient(gpt_client_name)
    
    if client_name.startswith("openrouter/"):
        openrouter_client_name = client_name.replace("openrouter/", "")
        return OpenRouterClient(openrouter_client_name)
    
    if "InternVL" in client_name:
        return InternVLClient(client_name, device=device)

    raise ValueError(f"Unknown client type: {client_name}")


if __name__ == "__main__":  # test any model on a prompt and a single image
    # Example usage:
    # Create a dummy image file for testing
    if not os.path.exists("dummy_image.jpg"):
        try:
            from PIL import Image
            img = Image.new('RGB', (100, 100), color = 'red')
            img.save('dummy_image.jpg')
            print("Created dummy_image.jpg for testing.")
        except ImportError:
            print("PIL/Pillow is not installed. Cannot create a dummy image.")
            print("Please create a file named 'dummy_image.jpg' to run the test.")

    if os.path.exists("dummy_image.jpg"):
        # Test OpenAI (requires OPENAI_API_KEY)
        # try:
        #     client = VLMClientFactory("gpt-4o-mini")
        #     response = client.generate("What color is this image?", ["dummy_image.jpg"])
        #     print(f"OpenAI response: {response}")
        # except Exception as e:
        #     print(f"Skipping OpenAI test: {e}")

        # Test InternVL
        try:
            # Make sure you have enough RAM/VRAM. This is a large model.
            # You might need to specify the device, e.g., device="cuda"
            client = VLMClientFactory("OpenGVLab/InternVL3-14B", device="cpu") 
            response = client.generate("Describe the image.", ["dummy_image.jpg"])
            print(f"InternVL response: {response}")
        except Exception as e:
            print(f"Skipping InternVL test: {e}")

        pass 