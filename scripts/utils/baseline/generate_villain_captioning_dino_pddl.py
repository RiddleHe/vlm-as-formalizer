import re
from ..build_prompts import build_problem_prompt
from ..parse_response import parse_pddl, parse_types
from ..helpers import detect_objects_with_dino


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


def generate_villain_captioning_dino_pddl(
    target,
    config, 
    model,
    observations,
    retry_idx,
):
    
    print(f"\n🎭 Pipeline 4b: VLM Captioning → DINO → PDDL (Enhanced) - Attempt {retry_idx+1}")
    
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
        print(caption[:200] + "..." if len(caption) > 200 else caption)
        
    except Exception as e:
        print(f"❌ Captioning failed: {e}")
        return "", f"Captioning failed: {e}", captioning_prompt
    
    # ============================
    # Step 2: DINO Detection based on Caption (new)
    # ============================
    
    print(f"\n🔍 Step 2: DINO Object Detection from Caption")
    
    # Extract domain types
    domain_types = parse_types(target["domain"])
    print(f"Domain types: {domain_types}")
    
    # Extract objects mentioned in caption
    caption_objects = extract_objects_from_caption(caption, domain_types)
    print(f"Objects extracted from caption: {caption_objects}")
    
    if not caption_objects:
        print("⚠️ No objects found in caption, falling back to basic detection")
        caption_objects = ["block", "robot"]  # fallback
    
    # Use DINO to detect objects from caption (following Pipeline 2 approach)
    all_detected_objects = {}
    
    for i, image_path in enumerate(observations):
        try:
            if caption_objects:
                bbox_annotations = detect_objects_with_dino(image_path, caption_objects)
                
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
        for obj_name, obj_data in list(all_detected_objects.items())[:5]:  # Show first 5
            bbox = obj_data["bbox"]
            phrase = obj_data["phrase"]
            print(f"  - {phrase}: bbox({int(bbox[0])}, {int(bbox[1])}, {int(bbox[2])}, {int(bbox[3])})")
        if len(all_detected_objects) > 5:
            print(f"  ... and {len(all_detected_objects) - 5} more")
    else:
        print("❌ No objects detected across all images")
    
    # ============================
    # Step 3: Enhanced PDDL Generation (modified)
    # ============================
    
    print(f"\n🔧 Step 3: Enhanced PDDL Generation")
    
    # Build base PDDL prompt
    base_prompt = build_problem_prompt(target, config, add_examples=True)
    
    # Create enhanced prompt with both caption and DINO results
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
        dino_summary = "No objects were successfully detected by the vision system."
    
    enhanced_prompt = base_prompt + f"""

SCENE CAPTION:
{caption}

{dino_summary}

Based on the above scene caption, object detection results, the images, and the instruction, generate the PDDL problem file.

Guidelines:
1. Use the caption to understand the scene context
2. Use the detection results to identify which objects are actually present
3. Focus only on objects that are relevant to the domain types: {', '.join(domain_types)}
4. Make sure all objects in the PDDL exist in the detection results
5. Include proper spatial relationships based on the detection positions

Generate the PDDL problem:
"""
    
    try:
        response = model.generate(enhanced_prompt, observations)
        
        print(f"🤖 Enhanced VLM PDDL Response:")
        print(response[:300] + "..." if len(response) > 300 else response)
        
    except Exception as e:
        error_msg = f"Enhanced PDDL generation failed: {e}"
        print(f"❌ {error_msg}")
        return "", error_msg, enhanced_prompt
    
    # Parse PDDL response
    problem_file = parse_pddl(response)
    
    print(f"\n✅ Pipeline 4b completed successfully!")
    
    return problem_file, response, enhanced_prompt 