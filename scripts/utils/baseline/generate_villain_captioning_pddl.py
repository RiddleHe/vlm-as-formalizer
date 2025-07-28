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
    # Step 1: Generate Domain-Aware Scene Caption
    # ============================
    
    # Build domain-aware captioning prompt
    captioning_prompt = f"""
You are helping a robotic planning task.
Given the image of a scene and an instruction, generate a detailed scene description.

For the current domain, this is the domain file:
{target["domain"]}

{config.get("text", "") if config else ""}
Instruction: {target["instruction"]}

Analyze the provided images and generate a detailed scene description that focuses on:
1. Objects and their types (especially those defined in the domain above)
2. Quantities of each object type
3. Spatial relationships between objects (particularly those matching domain predicates)
4. Current state of each object relevant to the planning task
5. Colors, positions, and other visual properties that help distinguish objects

IMPORTANT: 
- Focus on objects that are relevant to the domain types and the given instruction
- Describe relationships that match the predicates defined in the domain
- Be specific about object names and their distinguishing features
- Only generate a scene description, do NOT generate any PDDL

Provide a comprehensive scene description:
"""
    
    print(f"\n📸 Step 1: Generating Domain-Aware Scene Caption")
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