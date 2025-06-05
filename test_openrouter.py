#!/usr/bin/env python
"""
Test script for OpenRouter VLM integration.
Tests both direct OpenAI client usage and the VLMClient wrapper.
Relies on a local image named 'test_image.jpg' in the same directory.
"""

import os
import sys
import base64
from openai import OpenAI
from PIL import Image # For checking image validity if needed, not for downloading
import requests # Kept for image_to_base64_data_uri if it needs to handle URLs elsewhere
from io import BytesIO
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Add scripts directory to path to import VLMClient
sys.path.append('./scripts')
from models import VLMClient

LOCAL_TEST_IMAGE_PATH = "test_image.jpg"

def image_to_base64_data_uri(image_path):
    """Converts a local image to a base64 data URI."""
    if not os.path.exists(image_path):
        raise FileNotFoundError(f"Image not found at {image_path}")

    with open(image_path, "rb") as image_file:
        image_bytes = image_file.read()
    
    # Basic MIME type detection from extension
    ext = os.path.splitext(image_path)[1].lower()
    if ext == ".jpg" or ext == ".jpeg":
        mime_type = "image/jpeg"
    elif ext == ".png":
        mime_type = "image/png"
    else:
        mime_type = "application/octet-stream" # Fallback

    base64_encoded_data = base64.b64encode(image_bytes).decode('utf-8')
    return f"data:{mime_type};base64,{base64_encoded_data}"

def test_direct_openai_client():
    """Test OpenRouter using OpenAI client directly with a local image."""
    print("=== Testing Direct OpenAI Client with OpenRouter (Local Image) ===")
    
    if not os.path.exists(LOCAL_TEST_IMAGE_PATH):
        print(f"Local image {LOCAL_TEST_IMAGE_PATH} not found. Skipping direct OpenAI client test.")
        print()
        return

    # Initialize OpenAI client with OpenRouter base URL
    client = OpenAI(
        base_url="https://openrouter.ai/api/v1",
        api_key=os.getenv("OPENROUTER_API_KEY"),
    )
    
    try:
        base64_image_uri = image_to_base64_data_uri(LOCAL_TEST_IMAGE_PATH)
    except FileNotFoundError as e:
        print(e)
        return
    except Exception as e:
        print(f"Error converting image to base64: {e}")
        return

    # Test with a base64 encoded image URL
    completion = client.chat.completions.create(
        extra_headers={
            "HTTP-Referer": "https://github.com/your-repo/roboplan",
            "X-Title": "RoboPlan VLM Testing",
        },
        model="opengvlab/internvl3-14b:free",
        messages=[
            {
                "role": "user",
                "content": [
                    {
                        "type": "text",
                        "text": "Describe this image in detail. What objects do you see?"
                    },
                    {
                        "type": "image_url",
                        "image_url": {
                            "url": base64_image_uri
                        }
                    }
                ]
            }
        ]
    )
    
    print(f"Response: {completion.choices[0].message.content}")
    print(f"Model used: {completion.model}")
    print(f"Usage: {completion.usage}")
    print()

def test_local_image_with_vlm_client():
    """Test VLMClient with a local image."""
    print("=== Testing VLMClient with Local Image ===")
    
    if not os.path.exists(LOCAL_TEST_IMAGE_PATH):
        print(f"Local image {LOCAL_TEST_IMAGE_PATH} not found. Skipping VLMClient test.")
        print()
        return
    
    # Initialize VLMClient with OpenRouter
    model = VLMClient("openrouter/opengvlab/internvl3-14b:free", device="cuda")
    
    # Test prompt
    prompt = """You are analyzing an image for a robotic planning task.
    
Please describe:
1. What objects or entities you can see in the image
2. Their spatial relationships
3. Any actions that might be possible in this scene

Be specific and detailed."""
    
    try:
        # Generate response
        response = model.generate(prompt, [LOCAL_TEST_IMAGE_PATH])
        print(f"Response: {response}")
    except FileNotFoundError as e:
        print(e) # VLMClient should raise this if image is not found via its own checks
    except Exception as e:
        print(f"Error during VLMClient generate: {e}")
    print()

def test_multiple_models_with_local_image():
    """Test multiple models available on OpenRouter using a local image."""
    print("=== Testing Multiple OpenRouter Models (Local Image) ===")
    
    if not os.path.exists(LOCAL_TEST_IMAGE_PATH):
        print(f"Local image {LOCAL_TEST_IMAGE_PATH} not found. Skipping multiple models test.")
        print()
        return

    # List of models to test (using free tier models)
    models_to_test = [
        "openrouter/opengvlab/internvl3-14b:free",
        "openrouter/meta-llama/llama-3.2-11b-vision-instruct",
        "openrouter/qwen/qwen-2-vl-7b-instruct",
    ]
    
    prompt = "What objects do you see in this image? List them."
    
    for model_name in models_to_test:
        try:
            print(f"\nTesting model: {model_name}")
            model = VLMClient(model_name, device="cuda")
            response = model.generate(prompt, [LOCAL_TEST_IMAGE_PATH])
            print(f"Response: {response[:200]}...")  # Print first 200 chars
        except FileNotFoundError as e:
            print(f"Error for model {model_name}: {e}") 
        except Exception as e:
            print(f"Error with model {model_name}: {str(e)}")
    print()

def check_environment():
    """Check if all required environment variables are set"""
    required_vars = {
        "OPENROUTER_API_KEY": "OpenRouter API key",
        # "OPENAI_API_KEY": "OpenAI API key (optional if not testing direct OpenAI)"
    }
    
    missing_vars = []
    for var, description in required_vars.items():
        if not os.getenv(var):
            missing_vars.append(f"{var} ({description})")
    
    if missing_vars:
        print("Error: Missing required environment variables!")
        print("Please set the following variables in your .env file:")
        for var in missing_vars:
            print(f"  - {var}")
        print("\nExample .env file content:")
        print("OPENROUTER_API_KEY=your_openrouter_api_key_here")
        # print("OPENAI_API_KEY=your_openai_api_key_here") # Optional now
        return False
    return True

def main():
    print("Starting OpenRouter VLM tests (using local image 'test_image.jpg')...\n")
    
    # Check environment variables
    if not check_environment():
        return
    
    if not os.path.exists(LOCAL_TEST_IMAGE_PATH):
        print(f"CRITICAL: Local test image '{LOCAL_TEST_IMAGE_PATH}' not found.")
        print("Please place a JPEG or PNG image named 'test_image.jpg' in the root directory.")
        print("Aborting tests.")
        return

    try:
        # Run tests
        test_direct_openai_client()
        test_local_image_with_vlm_client()
        test_multiple_models_with_local_image()
        
        print("\nAll tests completed successfully (or skipped if image was missing)!")
        
    except Exception as e:
        print(f"\nError during testing: {str(e)}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 