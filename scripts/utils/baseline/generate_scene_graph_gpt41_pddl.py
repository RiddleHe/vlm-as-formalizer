import re
from ..build_prompts import build_problem_prompt, build_scene_graph_template
from ..parse_response import parse_pddl, parse_types, parse_objects
from ..helpers import detect_objects_with_gpt41


def extract_objects_from_scene_graph(scene_graph_text, domain_types):
    """
    Extract object names from scene graph text.
    
    Args:
        scene_graph_text: Raw scene graph text from VLM
        domain_types: List of valid domain types (e.g., ['block', 'robot'])
        
    Returns:
        List of object names found in the scene graph
    """
    objects = []
    
    # Parse both formats:
    # Format 1: "type: obj1, obj2, obj3"
    # Format 2: "type:\n- obj1\n- obj2\n- obj3"
    
    for domain_type in domain_types:
        # Look for lines like "block:"
        type_pattern = rf'{re.escape(domain_type)}:\s*(.*)(?:\n|$)'
        type_matches = re.findall(type_pattern, scene_graph_text, re.IGNORECASE | re.MULTILINE)
        
        for match in type_matches:
            match = match.strip()
            
            # Format 1: comma-separated on same line
            if ',' in match and not match.startswith('-'):
                obj_names = [obj.strip() for obj in match.split(',')]
                for obj_name in obj_names:
                    obj_name = obj_name.strip()
                    if obj_name and obj_name not in objects:
                        objects.append(obj_name)
            
            # Format 2: list format with "-" bullets (most common)
            elif not match or match.startswith('-'):
                # Find all bullet points after this type declaration
                lines = scene_graph_text.split('\n')
                found_type_line = False
                for line in lines:
                    line = line.strip()
                    if f'{domain_type}:' in line.lower():
                        found_type_line = True
                        continue
                    elif found_type_line:
                        if line.startswith('-'):
                            # Extract object name from "- object_name"
                            obj_name = line[1:].strip()
                            if obj_name and obj_name not in objects:
                                objects.append(obj_name)
                        elif line and not line.startswith(' ') and ':' in line:
                            # New section started, stop parsing this type
                            break
    
    return objects


def detect_repetition(text, min_repeat_length=20, similarity_threshold=0.8):
    """
    Detect if text contains repetitive patterns indicating VLM output loops.
    
    Args:
        text: Input text to analyze
        min_repeat_length: Minimum length of repeated sequence to consider
        similarity_threshold: How similar sequences need to be to count as repetition
        
    Returns:
        bool: True if repetition detected
    """
    if len(text) < min_repeat_length * 2:
        return False
    
    # Check for exact substring repetition
    text_length = len(text)
    half_length = text_length // 2
    
    # Look for repetitions in the latter half of the text
    for start in range(half_length, text_length - min_repeat_length):
        for length in range(min_repeat_length, text_length - start):
            substring = text[start:start + length]
            
            # Check if this substring appears earlier in the text
            if substring in text[:start]:
                # Check if the repetition continues
                remaining_text = text[start + length:]
                if remaining_text.startswith(substring[:min(len(substring), len(remaining_text))]):
                    return True
    
    return False


def truncate_at_repetition(text, min_repeat_length=20):
    """
    Truncate text at the point where repetition begins.
    
    Args:
        text: Input text
        min_repeat_length: Minimum length of repeated sequence
        
    Returns:
        str: Truncated text without repetitive ending
    """
    text_length = len(text)
    half_length = text_length // 2
    
    # Find the earliest point where repetition starts
    for start in range(half_length, text_length - min_repeat_length):
        for length in range(min_repeat_length, text_length - start):
            substring = text[start:start + length]
            
            # Check if this substring appeared before
            earlier_occurrence = text.find(substring, 0, start)
            if earlier_occurrence != -1:
                # Truncate at the start of repetition
                truncated = text[:start].strip()
                print(f"⚠️  Truncated PDDL repetition: {len(text)} → {len(truncated)} chars")
                return truncated
    
    return text


def generate_scene_graph_gpt41_pddl(
        target, 
        config, 
    model,
    observations,
    retry_idx,
    hard_template=True,
):

    print(f"\n🎯 Pipeline 5b: Scene Graph → GPT-4.1 → PDDL (hard_template={hard_template})")
    
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # =================================
    # Step 1: Generate Scene Graph
    # =================================
    
    print(f"📊 Step 1: Generating Scene Graph...")
    
    # Build scene graph prompt
    scene_graph_prompt = build_scene_graph_template(target["domain"])
    
    try:
        scene_graph_response = model.generate(scene_graph_prompt, observations)
        print(f"📊 SCENE GRAPH RESPONSE:")
        print(scene_graph_response)
        print("=" * 80)
        
    except Exception as e:
        print(f"Scene graph generation failed: {e}")
        return "", f"Scene graph generation failed: {e}", scene_graph_prompt
    
    # Extract raw scene graph content (truncate if repetitive)
    scene_graph_text = scene_graph_response.strip()
    if detect_repetition(scene_graph_text):
        scene_graph_text = truncate_at_repetition(scene_graph_text)
    
    print(f"📋 Extracted scene graph ({len(scene_graph_text)} chars)")
    
    # =================================
    # Step 2: GPT-4.1 Object Detection from Scene Graph
    # =================================
    
    print(f"🔍 Step 2: GPT-4.1 Object Detection from Scene Graph...")
    
    # Extract domain types and objects from scene graph
    domain_types = parse_types(target["domain"])
    objects_from_scene_graph = extract_objects_from_scene_graph(scene_graph_text, domain_types)
    
    print(f"Domain types: {domain_types}")
    print(f"Objects extracted from scene graph: {objects_from_scene_graph}")
    
    # Use GPT-4.1 to detect objects from scene graph
    detection_by_image = {}
    total_objects_detected = 0
    
    for i, image_path in enumerate(observations):
        image_key = f"Observation{i+1}"
        detection_by_image[image_key] = []
        
        try:
            if objects_from_scene_graph:
                bbox_annotations = detect_objects_with_gpt41(image_path, objects_from_scene_graph)
                
                if bbox_annotations:
                    print(f"✅ GPT-4.1 detected {len(bbox_annotations)} objects in image {i+1}")
                    for obj_name, obj_data in bbox_annotations.items():
                        detection_by_image[image_key].append({
                            "object": obj_data["phrase"],
                            "bbox": obj_data["bbox"]
                        })
                        total_objects_detected += 1
                else:
                    print(f"❌ GPT-4.1 found no objects in image {i+1}")
            else:
                print(f"⚠️ No objects found in scene graph for image {i+1}")
                        
        except Exception as e:
            print(f"❌ GPT-4.1 detection failed for {image_path}: {e}")
    
    # GPT-4.1 Detection Results Summary
    print(f"✅ Total objects detected: {total_objects_detected}")
    for image_key, detections in detection_by_image.items():
        if detections:
            objects_str = ", ".join([
                f"{det['object']}: bbox({int(det['bbox'][0])}, {int(det['bbox'][1])}, {int(det['bbox'][2])}, {int(det['bbox'][3])})"
                for det in detections
            ])
            print(f"  📸 {image_key}: {objects_str}")
        else:
            print(f"  📸 {image_key}: No objects detected")

    # =================================
    # Step 3: Enhanced PDDL Generation from Scene Graph + GPT-4.1
    # =================================
    
    print(f"🎯 Step 3: Enhanced PDDL Generation from Scene Graph + GPT-4.1...")
    
    # Build base PDDL prompt with scene graph
    base_prompt = build_problem_prompt(target, config)
    
    # Organize GPT-4.1 detection results by observation
    if total_objects_detected > 0:
        detection_info = "\nOBJECT DETECTION RESULTS:\n\n"

        observation_keys = sorted(detection_by_image.keys())
        for i, image_key in enumerate(observation_keys):
            detections = detection_by_image[image_key]
            
            if i == 0:
                detection_info += f"In the first observation image, the following objects were detected:\n"
            elif i == len(observation_keys) - 1:
                detection_info += f"In the final observation image, the objects are at these positions:\n"
            else:
                detection_info += f"In the {['second', 'third', 'fourth'][i-1]} observation image, the objects have moved to new positions:\n"
            
            if detections:
                for det in detections:
                    detection_info += f"- {det['object']} at position ({int(det['bbox'][0])}, {int(det['bbox'][1])}, {int(det['bbox'][2])}, {int(det['bbox'][3])})\n"
            else:
                detection_info += "- No objects detected\n"
            
            detection_info += "\n"
        
        detection_info += "This sequence shows the temporal progression of object positions as the robot performs manipulations.\n"
    
        enhanced_prompt = base_prompt + f"""

SCENE GRAPH:
{scene_graph_text}

{detection_info}

Based on the above scene graph, detailed object detection sequence organized by observation timeline, the images, and the instruction, generate the PDDL problem file.
The detection results show how objects move through space over time, which reflects the robot's manipulation actions.

Guidelines:
1. Use the scene graph to understand the scene structure
2. Use the detection results to identify which objects are actually present and their positions
3. Consider the temporal progression shown in the detection sequence

Generate the PDDL problem:
"""
    else:
        # Fallback when no objects detected by GPT-4.1
        enhanced_prompt = base_prompt + f"""

SCENE GRAPH:
{scene_graph_text}

No objects were detected by GPT-4.1. Generate the PDDL problem based on the scene graph and visual analysis of the images.

Generate the PDDL problem:
"""
    
    # VLM generates enhanced PDDL
    try:
        response = model.generate(enhanced_prompt, observations)
        
        # Handle repetitive VLM output
        response_text = response.strip()
        if detect_repetition(response_text):
            response_text = truncate_at_repetition(response_text)
    
        print(f"📄 ENHANCED PDDL RESPONSE:")
        print(response_text)
        print("=" * 80)
    
    except Exception as e:
        print(f"❌ Enhanced PDDL generation failed: {e}")
        return "", f"Enhanced PDDL generation failed: {e}", enhanced_prompt
    
    # Parse PDDL response
    problem_file = parse_pddl(response_text)
    
    # Auto-fix for unbalanced parentheses (common VLM issue)
    if not problem_file:
        print("🔍 This is likely due to unbalanced parentheses")
        print("🔧 Auto-fixing: Adding missing parentheses")
        
        # Count parentheses
        open_count = response_text.count('(')
        close_count = response_text.count(')')
            
        if open_count > close_count:
            missing_close = open_count - close_count
            fixed_response = response_text + ')' * missing_close
            problem_file = parse_pddl(fixed_response)
            
            if problem_file:
                print(f"✅ PDDL parsing successful after auto-fix")
            else:
                print("❌ PDDL parsing still failed after auto-fix")
                problem_file = ""  # Return empty string instead of None
        else:
            print("❌ PDDL parsing failed")
            problem_file = ""  # Return empty string instead of None
    else:
        print(f"✅ PDDL parsing successful ({len(problem_file)} chars)")
    
    print(f"\n✅ Pipeline 5b completed successfully!")
    
    return problem_file, response_text, enhanced_prompt 