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
    print("-" * 60)
    print("VLM Observation Prompt:")
    print(observation_prompt)
    print("-" * 60)
    
    try:
        object_response = model.generate(observation_prompt, observations)
        
        print("VLM Object Response:")
        print(object_response)
        print("-" * 60)
        
    except Exception as e:
        print(f"VLM object recognition failed: {e}")
        return "", f"VLM object recognition failed: {e}", observation_prompt
    
    # Parse objects from VLM response
    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)
    
    print("Parsed Objects:")
    for obj_type, obj_list in objects.items():
        print(f"  {obj_type}: {obj_list}")
    print("-" * 60)
    
    # =================================
    # Step 2: Use DINO to detect objects based on VLM identification
    # =================================
    
    # Convert parsed objects to DINO search terms (without slashes)
    dino_search_terms = []
    for obj_type, obj_list in objects.items():
        for obj_name in obj_list:
            # Remove underscores and create natural search terms for DINO
            search_term = obj_name.replace("_", " ")
            dino_search_terms.append(search_term)
    
    print(f"\n🎯 Step 2: DINO Object Detection")
    print(f"Search terms: {dino_search_terms}")
    print("-" * 60)
    
    # Detect objects from all images using VLM-identified terms
    all_detected_objects = {}
    detection_summary = []
    
    for i, image_path in enumerate(observations):
        try:
            if dino_search_terms:
                bbox_annotations = detect_objects_with_dino(image_path, dino_search_terms)
                
                if bbox_annotations:
                    for obj_name, obj_data in bbox_annotations.items():
                        # Add image index to make object names unique across images
                        unique_name = f"{obj_name}_img{i+1}"
                        all_detected_objects[unique_name] = obj_data
                        detection_summary.append(f"{obj_data['phrase']} (img{i+1})")
                        
        except Exception as e:
            print(f"DINO detection failed for {image_path}: {e}")
    
    # DINO Detection Results
    print(f"DINO Detection Results:")
    if all_detected_objects:
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            print(f"  - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
    else:
        print("  - No objects detected")
    print("-" * 60)
    
    # =================================
    # Step 3: VLM generates PDDL with DINO detection results
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
    
    print(f"\n🔧 Step 3: VLM PDDL Generation")
    print("Final VLM Prompt:")
    print("-" * 60)
    print(vilain_prompt)
    print("-" * 60)

    # VLM generates PDDL based on detection + images
    try:
        response = model.generate(vilain_prompt, observations)

        print(f"VLM PDDL Response:")
        print("-" * 60)
        print(response)
        print("-" * 60)

    except Exception as e:
        print(f"VLM PDDL generation failed: {e}")
        return "", f"VLM PDDL generation failed: {e}", vilain_prompt
    
    # Parse PDDL response
    problem_file = parse_pddl(response)
    
    print(f"Parsed PDDL:")
    print("-" * 60)
    if problem_file and problem_file.strip():
        print(problem_file)
    else:
        print("Failed to parse PDDL from response")
    print("-" * 60)
    
    return problem_file, response, vilain_prompt 