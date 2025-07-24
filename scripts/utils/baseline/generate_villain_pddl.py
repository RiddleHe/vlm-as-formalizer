from ..build_prompts import build_problem_prompt, build_observation_prompt
from ..parse_response import parse_pddl, parse_types, parse_objects
from ..helpers import detect_objects_with_dino

def generate_villain_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):

    print(f"\n🔍 Pipeline 2: ViLain (VLM → DINO → VLM) - Attempt {retry_idx+1}")
    
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # =================================
    # Step 1: VLM observes and identifies objects
    # =================================
    
    observation_prompt = build_observation_prompt(target, config)
    
    print(f"\n📸 Step 1: VLM Object Recognition")
    
    try:
        object_response = model.generate(observation_prompt, observations)
        print(f"VLM Response: {object_response}")
        
    except Exception as e:
        print(f"VLM object recognition failed: {e}")
        return "", f"VLM object recognition failed: {e}", observation_prompt
    
    # Parse objects from VLM response
    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)
    
    print("Parsed Objects:")
    for obj_type, obj_list in objects.items():
        print(f"  {obj_type}: {obj_list}")
    
    # =================================
    # Step 2: Convert to DINO search terms
    # =================================
    
    # Convert parsed objects to DINO search terms
    dino_search_terms = []
    
    for obj_type, obj_list in objects.items():
        for obj_name in obj_list:
            if isinstance(obj_name, str):
                # Clean the object name and convert to search term
                cleaned_name = " ".join(obj_name.strip().split())
                search_term = cleaned_name.replace("_", " ")
                
                if search_term and search_term not in dino_search_terms:
                    dino_search_terms.append(search_term)
    
    print(f"\n🎯 Step 2: DINO Search Terms: {dino_search_terms}")
    
    # =================================
    # Step 3: DINO Detection
    # =================================
    
    print(f"\n🔍 Step 3: DINO Object Detection")
    
    # Detect objects from all images using VLM-identified terms
    detection_by_image = {}
    total_objects_detected = 0
    
    for i, image_path in enumerate(observations):
        image_key = f"observation{i+1}"
        detection_by_image[image_key] = []
        
        try:
            if dino_search_terms:
                bbox_annotations = detect_objects_with_dino(image_path, dino_search_terms)
                
                if bbox_annotations:
                    print(f"✅ DINO detected {len(bbox_annotations)} objects in image {i+1}")
                    for obj_name, obj_data in bbox_annotations.items():
                        detection_by_image[image_key].append({
                            "object": obj_data["phrase"],
                            "bbox": obj_data["bbox"]
                        })
                        total_objects_detected += 1
                else:
                    print(f"❌ DINO found no objects in image {i+1}")
            else:
                print(f"⚠️ No search terms provided for image {i+1}")
                    
        except Exception as e:
            print(f"❌ DINO detection failed for {image_path}: {e}")
    
    # DINO Detection Results Summary
    print(f"✅ Total objects detected: {total_objects_detected}")
    for image_key, detections in detection_by_image.items():
        if detections:
            objects_str = ", ".join([
                f"{det['object']}: bbox({int(det['bbox'][0])}, {int(det['bbox'][1])}, {int(det['bbox'][2])}, {int(det['bbox'][3])})"
                for det in detections
            ])
            print(f"  📸 {image_key.capitalize()}: {objects_str}")
        else:
            print(f"  📸 {image_key.capitalize()}: No objects detected")

    # =================================
    # Step 4: VLM generates PDDL with DINO detection results
    # =================================
    
    base_prompt = build_problem_prompt(target, config)
    
    # Add DINO detection results to prompt
    if total_objects_detected > 0:
        detection_info = "Object detection results from Grounding DINO:\n\n"
        
        observation_keys = sorted(detection_by_image.keys())
        for i, image_key in enumerate(observation_keys):
            detections = detection_by_image[image_key]
            obs_num = image_key.replace("observation", "")
            
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
        
        # Combine base prompt with detection results
        vilain_prompt = base_prompt + f"""

{detection_info}

Based on this detailed object detection sequence organized by observation timeline and the image(s), generate the PDDL problem. 
The detection results show how objects move through space over time, which reflects the robot's manipulation actions.
"""
    else:
        # Fallback when no objects detected
        vilain_prompt = base_prompt + """

No objects were detected by Grounding DINO. Generate the PDDL problem based on visual analysis of the images.
"""
    
    print(f"\n🔧 Step 4: VLM PDDL Generation")
    
    # display the detection info that VLM actually received
    if total_objects_detected > 0:
        print("📋 VLM Received Detection Info:")
        print("=" * 60)
        print(detection_info)
        print("=" * 60)

    # VLM generates PDDL based on detection + images
    try:
        response = model.generate(vilain_prompt, observations)
        print(f"📄 VLM PDDL Response:")
        print("=" * 80)
        print(response)
        print("=" * 80)

    except Exception as e:
        print(f"VLM PDDL generation failed: {e}")
        return "", f"VLM PDDL generation failed: {e}", vilain_prompt
    
    # Parse PDDL response
    problem_file = parse_pddl(response)
    
    if problem_file and problem_file.strip():
        print(f"✅ PDDL generation successful")
    else:
        print("❌ Failed to parse PDDL from response")
    
    return problem_file, response, vilain_prompt 