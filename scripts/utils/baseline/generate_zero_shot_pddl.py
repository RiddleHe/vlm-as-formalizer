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
    
    print(f"\n🔍 Pipeline 2 Debug - Attempt {retry_idx+1}")
    print(f"📷 Input images: {[obs.split('/')[-1] for obs in observations]}")
    print(f"📝 Instruction: {target['instruction']}")
    
    # Step 1: Use Grounding DINO to detect objects from ALL images (ViLaIn step 1)
    if len(observations) == 0:
        return "", "No observations provided", ""
    
    # Infer domain name from target domain
    domain_name = "blocksworld"  # Default
    if "hanoi" in str(target.get("domain", "")).lower():
        domain_name = "hanoi"
    elif "cooking" in str(target.get("domain", "")).lower():
        domain_name = "cooking"
    
    print(f"🎯 Domain: {domain_name}")
    
    # Detect objects from all images and combine results
    all_detected_objects = {}
    detection_summary = []
    
    for i, image_path in enumerate(observations):
        try:
            print(f"🔎 Running DINO on image {i+1}: {image_path.split('/')[-1]}")
            bbox_annotations = detect_objects_with_dino(image_path, domain_name)
            
            if bbox_annotations:
                print(f"✅ DINO detected {len(bbox_annotations)} objects in image {i+1}:")
                for obj_name, obj_data in bbox_annotations.items():
                    bbox = obj_data["bbox"]
                    phrase = obj_data["phrase"]
                    print(f"   - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
                    
                    # Add image index to make object names unique across images
                    unique_name = f"{obj_name}_img{i+1}"
                    all_detected_objects[unique_name] = obj_data
                    detection_summary.append(f"{phrase} (img{i+1})")
            else:
                print(f"❌ No objects detected in image {i+1}")
                
        except Exception as e:
            print(f"💥 DINO detection failed for {image_path}: {e}")
    
    print(f"\n📊 Total detected objects: {len(all_detected_objects)}")
    print(f"📋 Summary: {', '.join(detection_summary) if detection_summary else 'None'}")
    
    # Step 2: Build ViLaIn-style prompt with detection results (ViLaIn approach - fair comparison)
    base_prompt = build_problem_prompt(target, config)
    
    # Add DINO detection results to prompt (this is the core ViLaIn approach)
    if all_detected_objects:
        detection_info = "Object detection results from Grounding DINO:\n"
        for obj_name, obj_data in all_detected_objects.items():
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            detection_info += f"- Detected: {phrase} at coordinates ({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})\n"
        
        # Combine base prompt with detection results (fair ViLaIn implementation)
        vilain_prompt = base_prompt + f"""

{detection_info}

Based on the above object detection results and the image(s), generate the PDDL problem.
"""
        print(f"\n✏️ Using ViLaIn prompt with {len(all_detected_objects)} detected objects")
    else:
        # Fallback when no objects detected
        vilain_prompt = base_prompt
        print(f"\n⚠️ No objects detected, using base prompt only")
    
    print(f"\n📝 VLM Prompt (first 200 chars):")
    print(vilain_prompt[:200] + "..." if len(vilain_prompt) > 200 else vilain_prompt)
    
    # Step 3: VLM generates PDDL based on detection + images (VLM replaces BLIP2+GPT)
    try:
        print(f"\n🤖 Calling VLM...")
        response = model.generate(vilain_prompt, observations)
        print(f"✅ VLM response received ({len(response)} chars)")
        
        print(f"\n📄 Raw VLM Response:")
        print("-"*80)
        print(response)
        print("-"*80)
        
    except Exception as e:
        print(f"💥 VLM generation failed: {e}")
        return "", f"VLM generation failed: {e}", vilain_prompt
    
    # Step 4: Parse PDDL response
    print(f"\n🔧 Parsing PDDL from response...")
    problem_file = parse_pddl(response)
    
    if problem_file is None or problem_file.strip() == "":
        print(f"❌ Failed to parse PDDL from response")
        problem_file = ""
    else:
        print(f"✅ Successfully parsed PDDL ({len(problem_file)} chars)")
    
    return problem_file, response, vilain_prompt 