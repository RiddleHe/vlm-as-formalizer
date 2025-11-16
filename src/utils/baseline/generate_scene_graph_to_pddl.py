from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl

def detect_repetition(text, threshold=5):
    """Detect meaningless repetitive patterns in text output, domain-agnostic"""
    lines = [line.strip() for line in text.split('\n') if line.strip()]
    
    # Check for consecutive identical lines (true repetitive loops)
    consecutive_count = 1
    for i in range(1, len(lines)):
        if lines[i] == lines[i-1]:
            consecutive_count += 1
            if consecutive_count >= threshold:
                return i - threshold + 1
        else:
            consecutive_count = 1
    
    # Check for excessive identical lines (non-consecutive)
    line_counts = {}
    for i, line in enumerate(lines):
        line_counts[line] = line_counts.get(line, 0) + 1
        if line_counts[line] > threshold * 2:
            for j, check_line in enumerate(lines):
                if check_line == line:
                    return j
    
    return -1

def truncate_at_repetition(response):
    """Truncate repetitive content while preserving valid structure"""
    lines = response.split('\n')
    repeat_pos = detect_repetition(response)
    if repeat_pos > 0:
        non_empty_lines = [line.strip() for line in lines if line.strip()]
        if repeat_pos < len(non_empty_lines):
            repeat_line = non_empty_lines[repeat_pos]
            truncate_idx = -1
            for i, line in enumerate(lines):
                if line.strip() == repeat_line:
                    count = sum(1 for prev_line in lines[:i] if prev_line.strip() == repeat_line)
                    if count >= repeat_pos:
                        truncate_idx = sum(len(lines[j]) + 1 for j in range(i))
                        break
            
            if truncate_idx > 0:
                return response[:truncate_idx].strip()
    
    return response

def generate_scene_graph_to_pddl(target, config, model, observations, retry_idx, hard_template=True):
    print(f"🎯 Pipeline 5a: Scene Graph → PDDL (hard_template={hard_template})")
    
    # Step 1: Generate Scene Graph ONLY
    print("📊 Step 1: Generating Scene Graph...")
    scene_graph_prompt = build_problem_prompt(
        target, 
        config, 
        add_examples=False,
        generate_scene_graph=True
    )
    
    scene_graph_prompt += """

IMPORTANT: 
1. Generate ONLY the scene graph based on the images
2. Do NOT generate any PDDL problem file  
3. Stop immediately after completing the scene graph
4. Follow the format shown above for scene graph generation
"""
    
    if hard_template:
        scene_graph_prompt += """
5. You must ONLY use the predicates defined in the domain file above. Do not invent new predicates or use predicates not explicitly listed in the domain.
"""
    
    # Generate scene graph
    raw_scene_graph_response = model.generate(scene_graph_prompt, observations)
    scene_graph_response = truncate_at_repetition(raw_scene_graph_response)
    if len(scene_graph_response) < len(raw_scene_graph_response):
        print(f"⚠️  Truncated repetition: {len(raw_scene_graph_response)} → {len(scene_graph_response)} chars")
    
    print("📊 SCENE GRAPH RESPONSE:")
    print(scene_graph_response)
    print("=" * 80)
    
    # Step 2: Extract scene graph content
    if "Scene graph:" in scene_graph_response:
        scene_graph_content = scene_graph_response.split("Scene graph:")[1]
        if "PDDL problem:" in scene_graph_content:
            scene_graph_content = scene_graph_content.split("PDDL problem:")[0]
        scene_graph_section = scene_graph_content.strip()
    else:
        scene_graph_section = scene_graph_response
        if "PDDL problem:" in scene_graph_section:
            scene_graph_section = scene_graph_section.split("PDDL problem:")[0].strip()
        if "(define " in scene_graph_section:
            scene_graph_section = scene_graph_section.split("(define ")[0].strip()
    
    print(f"📋 Extracted scene graph ({len(scene_graph_section)} chars)")
    
    # Step 3: Generate PDDL based on scene graph
    print("🎯 Step 2: Generating PDDL from scene graph...")
    pddl_prompt = build_problem_prompt(
        target,
        config, 
        add_examples=True,
        generate_scene_graph=False
    )
    
    pddl_prompt += f"""

The following scene graph has been generated from the image analysis:

Scene Graph:
{scene_graph_section}

Based on this structured scene graph and the images provided, generate the PDDL problem file.

Requirements:
1. All objects mentioned in the PDDL must exist in the scene graph
2. All predicates used must be consistent with the scene graph analysis
3. The initial state must reflect the current scene as described in the scene graph
4. The goal state must align with the given instruction
5. Generate a complete and properly formatted PDDL problem file
6. Avoid repetitive or contradictory statements

Generate the PDDL problem:
"""
    
    if hard_template:
        pddl_prompt += """

IMPORTANT: You must ONLY use the predicates defined in the domain file. Do not invent new predicates.
"""
    
    # Generate PDDL
    raw_pddl_response = model.generate(pddl_prompt, observations)
    pddl_response = truncate_at_repetition(raw_pddl_response)
    if len(pddl_response) < len(raw_pddl_response):
        print(f"⚠️  Truncated PDDL repetition: {len(raw_pddl_response)} → {len(pddl_response)} chars")
    
    print("📄 PDDL RESPONSE:")
    print(pddl_response)
    print("=" * 80)
    
    # Parse and return results
    full_response = f"""Scene graph:
{scene_graph_section}

PDDL problem: {pddl_response}"""
    
    problem_file = parse_pddl(pddl_response)
    
    if problem_file:
        print(f"✅ PDDL parsing successful ({len(problem_file)} chars)")
    else:
        print("❌ PDDL parsing failed, returning empty string")
        problem_file = ""
    
    return problem_file, full_response, scene_graph_prompt 