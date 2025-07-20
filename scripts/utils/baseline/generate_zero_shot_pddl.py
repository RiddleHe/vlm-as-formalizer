from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl
from ..helpers import detect_objects_with_dino

def generate_zero_shot_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):

    print(f"\n🔍 Pipeline 2 - Attempt {retry_idx+1}")
    
    # Step 1: Use Grounding DINO to detect objects from ALL images
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # Infer domain name from target domain
    domain_name = "blocksworld"  # Default
    if "hanoi" in str(target.get("domain", "")).lower():
        domain_name = "hanoi"
    elif "cooking" in str(target.get("domain", "")).lower():
        domain_name = "cooking"
    
    # Detect objects from all images and combine results
    all_detected_objects = {}
    detection_summary = []
    
    for i, image_path in enumerate(observations):
        try:
            bbox_annotations = detect_objects_with_dino(image_path, domain_name)
            
            if bbox_annotations:
                for obj_name, obj_data in bbox_annotations.items():
                    # Add image index to make object names unique across images
                    unique_name = f"{obj_name}_img{i+1}"
                    all_detected_objects[unique_name] = obj_data
                    detection_summary.append(f"{obj_data['phrase']} (img{i+1})")
                    
        except Exception as e:
            print(f"DINO detection failed for {image_path}: {e}")
    
    # 📊 DINO Detection Results
    print(f"\n📊 DINO Detection Results:")
    if all_detected_objects:
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            print(f"  - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
    else:
        print("  - No objects detected")
    
    # Step 2: Build ViLaIn-style prompt with detection results
    base_prompt = build_problem_prompt(target, config)
    
    # 📝 Base Prompt Content
    print(f"\n📝 Base Prompt:")
    print("-" * 60)
    print(base_prompt)
    print("-" * 60)
    
    # Add DINO detection results to prompt
    if all_detected_objects:
        detection_info = "Object detection results from Grounding DINO:\n"
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            detection_info += f"- Detected: {phrase} at coordinates ({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})\n"
        
        # Combine base prompt with detection results
        vilain_prompt = base_prompt + f"""

{detection_info}

Based on the above object detection results and the image(s), generate the PDDL problem.
"""
    else:
        # Fallback when no objects detected
        vilain_prompt = base_prompt
    
    # 🔗 ViLaIn Prompt Content
    print(f"\n🔗 ViLaIn Prompt (Base + DINO):")
    print("-" * 60)
    print(vilain_prompt)
    print("-" * 60)

    # Step 3: VLM generates PDDL based on detection + images
    try:
        response = model.generate(vilain_prompt, observations)

        # 🤖 VLM Response
        print(f"\n🤖 VLM Response:")
        print("-" * 60)
        print(response)
        print("-" * 60)

    except Exception as e:
        print(f"VLM generation failed: {e}")
        return "", f"VLM generation failed: {e}", vilain_prompt
    
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
    
    return problem_file, response, vilain_prompt 