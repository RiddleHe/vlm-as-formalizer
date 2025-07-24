import re
from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl, parse_types
from ..helpers import detect_objects_with_dino


def detect_repetition(text, threshold=5):
    """Detect meaningless repetitive patterns in text output, domain-agnostic"""
    lines = [line.strip() for line in text.split('\n') if line.strip()]
    
    consecutive_count = 1
    for i in range(1, len(lines)):
        if lines[i] == lines[i-1]:
            consecutive_count += 1
            if consecutive_count >= threshold:
                return i - threshold + 1
        else:
            consecutive_count = 1
    
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


def extract_objects_from_scene_graph(scene_graph_text, domain_types):
    """
    Extract object mentions from scene graph for DINO detection.
    Parse structured scene graph format: "type: obj1, obj2, obj3"
    """
    objects = []
    
    for obj_type in domain_types:
        # Look for structured format: "block: wrench, green_block, blue_block, ..."
        # or "robot: robot1"
        pattern = rf'{obj_type}:\s*([^\n]+)'
        match = re.search(pattern, scene_graph_text, re.IGNORECASE)
        
        if match:
            # Parse comma-separated object list
            obj_list_text = match.group(1).strip()
            
            # Skip if explicitly "none" or empty
            if obj_list_text and obj_list_text.lower() not in ['none', '']:
                # Split by comma and clean up object names
                for obj in obj_list_text.split(','):
                    obj_name = obj.strip()
                    if obj_name and obj_name.lower() != 'none':
                        objects.append(obj_name)
    
    return objects


def generate_scene_graph_dino_pddl(target, config, model, observations, retry_idx, hard_template=True):
    print(f"🎯 Pipeline 5b: Scene Graph → DINO → PDDL (hard_template={hard_template})")
    
    # ============================
    # Step 1: Generate Scene Graph
    # ============================
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
    
    # ============================
    # Step 2: Extract Scene Graph Content
    # ============================
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
    
    # ============================
    # Step 3: DINO Object Detection from Scene Graph
    # ============================
    print("🔍 Step 2: DINO Object Detection from Scene Graph...")
    
    # Extract domain types and objects from scene graph
    domain_types = parse_types(target["domain"])
    print(f"Domain types: {domain_types}")
    
    # Extract objects mentioned in scene graph
    scene_graph_objects = extract_objects_from_scene_graph(scene_graph_section, domain_types)
    print(f"Objects extracted from scene graph: {scene_graph_objects}")
    
    if not scene_graph_objects:
        print("⚠️ No objects found in scene graph, using domain types as fallback")
        scene_graph_objects = domain_types  # Use domain types as fallback
    
    # Use DINO to detect objects from scene graph
    all_detected_objects = {}
    
    for i, image_path in enumerate(observations):
        try:
            if scene_graph_objects:
                bbox_annotations = detect_objects_with_dino(image_path, scene_graph_objects)
                
                if bbox_annotations:
                    print(f"✅ DINO detected {len(bbox_annotations)} objects in image {i+1}")
                    for obj_name, obj_data in bbox_annotations.items():
                        # Add image index to make object names unique across images
                        unique_name = f"{obj_name}_img{i+1}"
                        all_detected_objects[unique_name] = obj_data
                else:
                    print(f"❌ DINO found no objects in image {i+1}")
            else:
                print(f"⚠️ No search terms provided for image {i+1}")
                        
        except Exception as e:
            print(f"❌ DINO detection failed for {image_path}: {e}")
    
    # Display results summary
    if all_detected_objects:
        print(f"✅ Total objects detected: {len(all_detected_objects)}")
        for obj_name, obj_data in all_detected_objects.items():  # Show all objects
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            print(f"  - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
    else:
        print("❌ No objects detected across all images")
    
    # ============================
    # Step 4: Enhanced PDDL Generation
    # ============================
    print("🎯 Step 3: Enhanced PDDL Generation from Scene Graph + DINO...")
    
    # Build enhanced PDDL prompt
    pddl_prompt = build_problem_prompt(
        target,
        config, 
        add_examples=True,
        generate_scene_graph=False
    )
    
    # Create DINO detection summary
    dino_summary = ""
    if all_detected_objects:
        dino_summary = f"""

OBJECT DETECTION RESULTS:
The following objects were detected in the images with their locations:
"""
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            dino_summary += f"- {phrase}: located at position ({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})\n"
    else:
        dino_summary = "\nNo objects were successfully detected by the vision system."
    
    # Enhanced prompt with scene graph and DINO results
    enhanced_pddl_prompt = pddl_prompt + f"""

SCENE GRAPH ANALYSIS:
The following scene graph has been generated from the image analysis:

{scene_graph_section}

{dino_summary}

Based on this structured scene graph, object detection results, the images, and the instruction, generate the PDDL problem file.

Requirements:
1. Use the scene graph to understand the scene structure and relationships
2. Use the detection results to identify which objects are actually present and their locations
3. All objects mentioned in the PDDL must exist in either the scene graph or detection results
4. All predicates used must be consistent with the scene graph analysis
5. The initial state must reflect the current scene as described in the scene graph
6. The goal state must align with the given instruction
7. Generate a complete and properly formatted PDDL problem file
8. Avoid repetitive or contradictory statements

Generate the PDDL problem:
"""
    
    if hard_template:
        enhanced_pddl_prompt += """

IMPORTANT: You must ONLY use the predicates defined in the domain file. Do not invent new predicates.
"""
    
    # Generate enhanced PDDL
    raw_pddl_response = model.generate(enhanced_pddl_prompt, observations)
    pddl_response = truncate_at_repetition(raw_pddl_response)
    if len(pddl_response) < len(raw_pddl_response):
        print(f"⚠️  Truncated PDDL repetition: {len(raw_pddl_response)} → {len(pddl_response)} chars")
    
    print("📄 ENHANCED PDDL RESPONSE:")
    print(pddl_response)
    print("=" * 80)
    
    # Parse and return results
    full_response = f"""Scene graph:
{scene_graph_section}

{dino_summary}

PDDL problem: {pddl_response}"""
    
    problem_file = parse_pddl(pddl_response)
    
    if problem_file:
        print(f"✅ PDDL parsing successful ({len(problem_file)} chars)")
    else:
        print("❌ PDDL parsing failed, returning empty string")
        problem_file = ""
    
    print(f"\n✅ Pipeline 5b completed successfully!")
    
    return problem_file, full_response, scene_graph_prompt 