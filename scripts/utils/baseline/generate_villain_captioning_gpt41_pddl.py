import re
from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl, parse_types
from ..helpers import detect_objects_with_gpt41


def extract_objects_from_caption(caption, domain_types):
    """
    Extract object names and types from VLM caption.
    More sophisticated than simple parsing - uses context clues.
    """
    objects = []
    
    # Look for color + type patterns (e.g., "green block", "blue cube")
    for obj_type in domain_types:
        # Pattern: color/descriptor + object_type
        pattern = r'(\w+)\s+' + re.escape(obj_type) + r's?'
        matches = re.findall(pattern, caption, re.IGNORECASE)
        
        for match in matches:
            color_or_desc = match.lower()
            # Skip generic words
            if color_or_desc not in ['the', 'a', 'an', 'some', 'various', 'different']:
                obj_name = f"{color_or_desc} {obj_type}"
                if obj_name not in objects:
                    objects.append(obj_name)
    
    # Extract any adjective + object_type patterns from the caption text
    # This approach is more general and doesn't hardcode specific descriptors
    for obj_type in domain_types:
        # Look for any word followed by object type
        pattern = r'(\w+)\s+' + re.escape(obj_type) + r's?\b'
        additional_matches = re.findall(pattern, caption, re.IGNORECASE)
        for match in additional_matches:
            descriptor = match.lower()
            # Skip very generic words and articles
            if descriptor not in ['the', 'a', 'an', 'some', 'various', 'different', 'many', 'several', 'few', 'all']:
                obj_name = f"{descriptor} {obj_type}"
                if obj_name not in objects:
                    objects.append(obj_name)
    
    return objects


def generate_villain_captioning_gpt41_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):
    
    print(f"\n🎭 Pipeline 4b-GPT: VLM Captioning → GPT-4.1 → PDDL (Enhanced) - Attempt {retry_idx+1}")
    
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # ============================
    # Step 1: Generate Scene Caption (from 4a)
    # ============================
    
    captioning_prompt = f"""
Analyze the provided images and generate a detailed scene description.
Focus on:
1. Objects and their colors/types (be specific about colors)
2. Quantities of each object  
3. Spatial relationships between objects
4. Current state of each object

Describe what you see in the images in detail, focusing on objects that might be relevant to planning tasks:
"""
    
    print(f"\n📸 Step 1: Generating Scene Caption")
    
    try:
        caption = model.generate(captioning_prompt, observations)
        print(f"Generated Caption:")
        print(caption)
        
    except Exception as e:
        print(f"❌ Captioning failed: {e}")
        return "", f"Captioning failed: {e}", captioning_prompt
    
    # ============================
    # Step 2: GPT-4.1 Detection based on Caption (new)
    # ============================
    
    print(f"\n🔍 Step 2: GPT-4.1 Object Detection from Caption")
    
    # Extract domain types
    domain_types = parse_types(target["domain"])
    print(f"Domain types: {domain_types}")
    
    # Extract objects mentioned in caption
    caption_objects = extract_objects_from_caption(caption, domain_types)
    print(f"Objects extracted from caption: {caption_objects}")
    
    if not caption_objects:
        print("⚠️ No objects found in caption, falling back to basic detection")
        caption_objects = ["block", "robot"]  # fallback
    
            # Use GPT-4.1 to detect objects from caption
    detection_by_image = {}
    total_objects_detected = 0
    
    for i, image_path in enumerate(observations):
        image_key = f"observation{i+1}"
        detection_by_image[image_key] = []
        
        try:
            if caption_objects:
                bbox_annotations = detect_objects_with_gpt41(image_path, caption_objects)
                
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
                print(f"⚠️ No search terms provided for image {i+1}")
                        
        except Exception as e:
            print(f"❌ GPT-4.1 detection failed for {image_path}: {e}")
    
    # Display results summary
    print(f"✅ Total objects detected: {total_objects_detected}")
    for image_key, detections in detection_by_image.items():
        if detections:
            print(f"  📸 {image_key.capitalize()}:")
            for det in detections:
                print(f"    - {det['object']}: bbox({int(det['bbox'][0])}, {int(det['bbox'][1])}, {int(det['bbox'][2])}, {int(det['bbox'][3])})")
        else:
            print(f"  📸 {image_key.capitalize()}: No objects detected")

    # ============================
    # Step 3: Enhanced PDDL Generation (modified)
    # ============================
    
    print(f"\n🔧 Step 3: Enhanced PDDL Generation")
    
    # Build base PDDL prompt
    base_prompt = build_problem_prompt(target, config, add_examples=True)
    
    # Create enhanced prompt with caption and organized GPT-4.1 results
    gpt41_summary = ""
    if total_objects_detected > 0:
        gpt41_summary = "OBJECT DETECTION RESULTS:\n\n"
        
        observation_keys = sorted(detection_by_image.keys())
        for i, image_key in enumerate(observation_keys):
            detections = detection_by_image[image_key]
            
            if i == 0:
                gpt41_summary += f"In the first observation image, the following objects were detected:\n"
            elif i == len(observation_keys) - 1:
                gpt41_summary += f"In the final observation image, the objects are at these positions:\n"
            else:
                gpt41_summary += f"In the {['second', 'third', 'fourth'][i-1]} observation image, the objects have moved to new positions:\n"
            
            if detections:
                for det in detections:
                    gpt41_summary += f"- {det['object']} at position ({int(det['bbox'][0])}, {int(det['bbox'][1])}, {int(det['bbox'][2])}, {int(det['bbox'][3])})\n"
            else:
                gpt41_summary += "- No objects detected\n"
            
            gpt41_summary += "\n"
        
        gpt41_summary += "This sequence shows the temporal progression of object positions as the robot performs manipulations.\n"
    else:
        gpt41_summary = "No objects were successfully detected by the vision system.\n"
    
    enhanced_prompt = base_prompt + f"""

SCENE CAPTION:
{caption}

{gpt41_summary}

Based on the above scene caption, detailed object detection sequence organized by observation timeline, the images, and the instruction, generate the PDDL problem file.
The detection results show how objects move through space over time, which reflects the robot's manipulation actions.

Guidelines:
1. Use the caption to understand the scene context
2. Use the detection results to identify which objects are actually present and their positions
3. Consider the temporal progression shown in the detection sequence

Generate the PDDL problem:
"""
    
    print(f"\n📋 VLM Received Enhanced Prompt:")
    print("=" * 80)
    print(enhanced_prompt)
    print("=" * 80)
    
    try:
        response = model.generate(enhanced_prompt, observations)
        
        print(f"\n🤖 VLM Complete PDDL Response ({len(response)} characters):")
        print("=" * 80)
        print(response)
        print("=" * 80)
        
    except Exception as e:
        error_msg = f"Enhanced PDDL generation failed: {e}"
        print(f"❌ {error_msg}")
        return "", error_msg, enhanced_prompt
    
    # Parse PDDL response
    problem_file = parse_pddl(response)
    
    if problem_file is None:
        # Auto-fix unbalanced parentheses
        if "(define" in response:
            start_idx = response.find("(define")
            pddl_content = response[start_idx:].strip()
            
            open_count = pddl_content.count('(')
            close_count = pddl_content.count(')')
            
            if open_count > close_count:
                missing_brackets = open_count - close_count
                pddl_content += ')' * missing_brackets
                print(f"🔧 Auto-fixed: Added {missing_brackets} missing parentheses")
                
                problem_file = parse_pddl(pddl_content)
                if problem_file:
                    print(f"✅ PDDL parsing successful after auto-fix")
                    print(f"\n📄 Final Parsed PDDL:")
                    print("=" * 80)
                    print(problem_file)
                    print("=" * 80)
                else:
                    print("❌ PDDL parsing failed even after auto-fix")
                    problem_file = ""
            else:
                print("❌ PDDL parsing failed: Cannot auto-fix")
                problem_file = ""
        else:
            print("❌ PDDL parsing failed: No '(define' found")
            problem_file = ""
    else:
        print(f"✅ PDDL parsing successful")
        print(f"\n📄 Final Parsed PDDL:")
        print("=" * 80)
        print(problem_file)
        print("=" * 80)
    
    print(f"\n✅ Pipeline 4b completed successfully!")
    
    return problem_file, response, enhanced_prompt 