from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl

def generate_villain_direct_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):

    print(f"\n🔍 Pipeline 3: VLM Direct PDDL Generation - Attempt {retry_idx+1}")
    
    # Allow caption-only mode when observations are empty
    if len(observations) == 0:
        print("Caption-only mode: No images provided, using text description only")
    
    # Step 1: Build base prompt for direct PDDL generation
    base_prompt = build_problem_prompt(target, config)
    
    # 📝 Base Prompt Content
    print(f"\n📝 Base Prompt:")
    print("-" * 60)
    print(base_prompt)
    print("-" * 60)
    
    # Step 2: Create direct PDDL generation prompt (no DINO detection)
    direct_prompt = base_prompt + """

Based on the image(s) and the instruction above, directly generate the PDDL problem file.
Analyze the visual scene to identify objects and their relationships, then create the appropriate PDDL problem.
"""
    
    # 🎯 Direct PDDL Prompt Content
    print(f"\n🎯 Direct PDDL Prompt:")
    print("-" * 60)
    print(direct_prompt)
    print("-" * 60)

    # Step 3: VLM generates PDDL directly from images
    try:
        response = model.generate(direct_prompt, observations)

        # 🤖 VLM Response
        print(f"\n🤖 VLM Response:")
        print("-" * 60)
        print(response)
        print("-" * 60)

    except Exception as e:
        print(f"VLM generation failed: {e}")
        return "", f"VLM generation failed: {e}", direct_prompt
    
    # Step 4: Parse PDDL response
    problem_file = parse_pddl(response)
    
    # 🔧 Parsed PDDL Content
    print(f"\n🔧 Parsed PDDL:")
    print("-" * 60)
    if problem_file and problem_file.strip():
        print(problem_file)
    else:
        print("Failed to parse PDDL from response")
    print("-" * 60)
    
    return problem_file, response, direct_prompt 