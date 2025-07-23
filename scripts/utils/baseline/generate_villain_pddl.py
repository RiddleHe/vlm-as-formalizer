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
    all_detected_objects = {}
    
    for i, image_path in enumerate(observations):
        try:
            if dino_search_terms:
                bbox_annotations = detect_objects_with_dino(image_path, dino_search_terms)
            
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
    
    # DINO Detection Results Summary
    if all_detected_objects:
        print(f"✅ Total objects detected: {len(all_detected_objects)}")
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            print(f"  - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
    else:
        print("❌ No objects detected across all images")
    
    # =================================
    # Step 4: VLM generates PDDL with DINO detection results
    # =================================
    
    base_prompt = build_problem_prompt(target, config)
    
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
        vilain_prompt = base_prompt + """

No objects were detected by Grounding DINO. Generate the PDDL problem based on visual analysis of the images.
"""
    
    print(f"\n🔧 Step 4: VLM PDDL Generation")

    # VLM generates PDDL based on detection + images
    try:
        response = model.generate(vilain_prompt, observations)
        print(f"VLM PDDL Response: {response[:200]}..." if len(response) > 200 else f"VLM PDDL Response: {response}")

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