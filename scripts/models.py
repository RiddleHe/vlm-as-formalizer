import os
import base64
import torch

def get_gpt_client_name(client_name):
    if "gpt" in client_name:
        return client_name + "-2025-04-14"
    elif "o3-mini" in client_name:
        return client_name + "-2025-01-31"
    elif "o4-mini" in client_name:
        return client_name + "-2025-04-16"

class VLMClient:
    def __init__(self, client_name, device):
        # Determine client type
        if any(name in client_name for name in ["gpt", "o3", "o4"]):  # OpenAI models
            self.type = "openai"
            self.client_name = get_gpt_client_name(client_name)

        elif "/" in client_name:
            self.type = "huggingface"
            self.client_name = client_name

        if self.client_name is None:
            raise ValueError(f"Unknown client type: {client_name}")
        
        # Load client
        if self.type == "openai":
            from openai import OpenAI
            self.client = OpenAI(
                api_key=os.getenv("OPENAI_API_KEY"),
            )
        elif self.type == "huggingface":
            from transformers import pipeline
            self.client = pipeline(
                "image-text-to-text",
                model=client_name,
                device=device,
                torch_dtype=torch.bfloat16
            )
            # print(f"Model config: {self.client.model.config}")
        print(f"Loaded {self.type} client: {self.client_name}")

    def generate(self, prompt: str, observations: list[str]):
        base64_images = []
        for observation in observations:
            with open(observation, "rb") as image_file:
                base64_image = base64.b64encode(image_file.read()).decode("utf-8")
                base64_images.append(base64_image)

        if self.type == "openai":
            content = []
            for base64_image in base64_images:
                content.append({
                    "type": "input_image",
                    "image_url": f"data:image/jpeg;base64,{base64_image}"
                })
            content.append({"type": "input_text", "text": prompt})  # Preserve order of content

            # Generate response
            response = self.client.responses.create(
                model=self.client_name,
                input=[{
                    "role": "user",
                    "content": content
                }],
            )
            full_answer = response.output_text

        elif self.type == "huggingface":
            content = [
                {"type": "text", "text": prompt},
            ]
            if observation is not None:
                content.append({
                    "type": "image",
                    "path": observation,
                })

            messages = [
                {
                    "role": "user",
                    "content": content,
                },
            ]
            response = self.client(text=messages, max_new_tokens=1024)
            full_answer = response[0]["generated_text"][1]["content"]

        return full_answer