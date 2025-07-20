"""
Pipeline 4a: VLM Captioning → PDDL Generation (Without DINO)
Two-step approach: 
1. Generate detailed scene caption using VLM
2. Use caption + images to generate PDDL
"""

from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl


def generate_villain_captioning_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):
    
    print(f"\n🎭 Pipeline 4a: VLM Captioning → PDDL (Without DINO) - Attempt {retry_idx+1}")
    
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # ============================
    # Step 1: Generate Scene Caption
    # ============================
    
    captioning_prompt = f"""
Analyze the provided images and generate a detailed scene description.
Focus on:
1. Objects and their colors/types
2. Quantities of each object
3. Spatial relationships between objects  
4. Current state of each object

Describe what you see in the images in detail, focusing on objects that might be relevant to planning tasks.

Provide a comprehensive scene description:
"""
    
    print(f"\n📸 Step 1: Generating Scene Caption")
    print("-" * 60)
    
    try:
        # Generate caption using VLM
        caption = model.generate(captioning_prompt, observations)
        
        print(f"Generated Caption:")
        print(caption)
        print("-" * 60)
        
    except Exception as e:
        print(f"Captioning failed: {e}")
        return "", f"Captioning failed: {e}", captioning_prompt
    
    # =======================
    # Step 2: Caption → PDDL  
    # =======================
    
    # Build PDDL generation prompt with caption
    base_prompt = build_problem_prompt(target, config, add_examples=True)
    
    # Create caption-enhanced prompt
    pddl_prompt = base_prompt + f"""

SCENE CAPTION:
{caption}

Based on the above scene caption, the images, and the instruction, generate the PDDL problem file.
Use the caption to understand what objects are present and their current state.
Make sure the PDDL problem accurately reflects the scene described in the caption.

Generate the PDDL problem:
"""
    
    print(f"\n🔧 Step 2: Generating PDDL from Caption")
    print(f"\n📝 PDDL Generation Prompt:")
    print("-" * 60)
    print(pddl_prompt)
    print("-" * 60)
    
    try:
        # Generate PDDL using VLM with both caption and images
        response = model.generate(pddl_prompt, observations)
        
        print(f"\n🤖 VLM PDDL Response:")
        print("-" * 60)
        print(response)
        print("-" * 60)
        
    except Exception as e:
        error_msg = f"PDDL generation failed: {e}"
        print(f"❌ {error_msg}")
        return "", error_msg, pddl_prompt
    
    # Step 3: Parse PDDL response
    problem_file = parse_pddl(response)
    
    print(f"\n🔧 Parsed PDDL:")
    print("-" * 60)
    if problem_file and problem_file.strip():
        print(problem_file)
    else:
        print("Failed to parse PDDL from response")
    print("-" * 60)
    
    return problem_file, response, pddl_prompt 