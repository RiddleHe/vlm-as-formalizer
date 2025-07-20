import os
import sys
import numpy as np
import itertools

from ..build_prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_goal_prompt,
    build_plan_prompt,
    build_observation_prompt,
)
from ..parse_response import (
    parse_pddl, 
    parse_plan, 
    parse_objects, 
    parse_types, 
    parse_predicates, 
    parse_block,
    assemble_object_states,
    assemble_grounded_predicates,
    assemble_pddl,
)
from ..checkers import check_error
from ..models import predict_relation_probs
from ..sgclip import predict_all_relations, setup_and_load_models, get_classes_ls, get_batched_objects
from ..helpers import observations_to_images, extract_relation_types

def convert_numpy_types(obj):
    """Recursively convert numpy and torch types to Python native types for JSON serialization"""
    import torch
    if isinstance(obj, dict):
        return {key: convert_numpy_types(value) for key, value in obj.items()}
    elif isinstance(obj, list):
        return [convert_numpy_types(item) for item in obj]
    elif isinstance(obj, tuple):
        return tuple(convert_numpy_types(item) for item in obj)
    elif isinstance(obj, (np.integer, np.int64, np.int32)):
        return int(obj)
    elif isinstance(obj, (np.floating, np.float64, np.float32)):
        return float(obj)
    elif isinstance(obj, np.ndarray):
        return obj.tolist()
    elif isinstance(obj, torch.Tensor):
        return float(obj.detach().cpu().numpy()) if obj.numel() == 1 else obj.detach().cpu().numpy().tolist()
    else:
        return obj

def generate_multi_step_with_cv(
    target,
    config,
    model,
    observations,
    retry_idx,
    result_dir=None,
    save_step=None,
    task_name=None,
):
    import time
    import os
    import shutil
    import json
    
    # Extract task name from observations path if not provided
    if task_name is None and observations and len(observations) > 0:
        # Extract from path like "../data/blocksworld/observations/problem1.jpg"
        obs_path = observations[0]
        if isinstance(obs_path, str):
            import re
            # Look for pattern like "problem1", "problem2", etc.
            match = re.search(r'problem\d+', obs_path)
            if match:
                task_name = match.group(0)
    
    # Start overall timing
    start_time = time.time()
    
    # Step 1: Build observation prompt and generate object response
    step1_start = time.time()
    observation_prompt = build_observation_prompt(target, config)
    object_response, past_key_values = model.generate(observation_prompt, observations, return_cache=True)
    step1_time = time.time() - step1_start
    print(f"⏱️  Step 1 (Object Detection): {step1_time:.2f}s")

    print("--------------------------------")
    print(object_response)

    # Step 2: Parse objects and build grounded predicates
    step2_start = time.time()
    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)

    object_states = assemble_object_states(objects)

    print("---------------objects--------------")
    print(objects)

    predicates = parse_predicates(target["domain"])

    # Build all possible predicates
    all_grounded_predicates = []
    all_predicate_strs = []
    for predicate_name, predicate_info in predicates.items():
        predicate_args = predicate_info["args"]
        comment = predicate_info.get("comment", "")

        if len(predicate_args) == 1:  # unary relation
            typed_objects = objects[predicate_args[0]]
            all_grounded_predicates.extend([
                {"name": predicate_name, "args": [obj]} for obj in typed_objects
            ])

            for obj in typed_objects:
                obj_str = f"{predicate_args[0]} {obj}"
                all_predicate_strs.extend([
                    comment.format(x=obj_str)
                ])
        
        elif len(predicate_args) == 2:  # binary relation
            type_1, type_2 = predicate_args
            type_1_objects, type_2_objects = objects[type_1], objects[type_2]
            for obj1, obj2 in itertools.product(type_1_objects, type_2_objects):
                if obj1 != obj2:
                    all_grounded_predicates.append({
                        "name": predicate_name,
                        "args": [obj1, obj2]
                    })
                    obj1_str = f"{type_1} {obj1}"
                    obj2_str = f"{type_2} {obj2}"
                    all_predicate_strs.append(
                        comment.format(x=obj1_str, y=obj2_str)
                    )

        else:
            raise NotImplementedError("Only unary and binary relations are supported")

    print("--------------grounded predicates---------------")
    print(all_grounded_predicates)
    unary_relations, binary_relations = extract_relation_types(all_grounded_predicates)
    print("--------------unary relations---------------")
    print(unary_relations)
    print("--------------binary relations---------------")
    print(binary_relations)
    images = observations_to_images(observations)
    
    step2_time = time.time() - step2_start
    print(f"⏱️  Step 2 (Parsing & Building Predicates): {step2_time:.2f}s")
    
    print("----------Using YOLOE with prompts via sgclip------------")
    
    # Setup and load models with YOLOE detector via sgclip
    import torch
    import cv2
    import numpy as np
    from datetime import datetime
    BASE_DIR = "/home/mh3897/yuxi/villain"  # Adjust path as needed
    DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
    models = setup_and_load_models(BASE_DIR, DEVICE, detector_type="dino")
    
    # Use sgclip's predict_all_relations to get detection results with prompts
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Create output directory for results
    if result_dir and save_step:
        # Use the same structure as main.py saves results
        output_dir = os.path.join(result_dir, save_step, "intermediate_results")
        if task_name:
            output_dir = os.path.join(output_dir, task_name)
        else:
            output_dir = os.path.join(output_dir, f"unknown_problem_{timestamp}")
    else:
        # Fallback to original behavior
        if task_name:
            output_dir = f"detection_results/{task_name}"
        else:
            output_dir = f"detection_results/unknown_problem_{timestamp}"
    os.makedirs(output_dir, exist_ok=True)
    
    # Convert images to numpy arrays for sgclip
    images_np = []
    for image in images:
        if hasattr(image, 'convert'):
            images_np.append(np.array(image.convert('RGB')))
        else:
            images_np.append(image)
    
    object_classes = []
    for obj_class in objects.keys():
        if objects[obj_class]:  # Only include classes that have instances
            for instance in objects[obj_class]:
                # Remove underscores for DINO detection
                detectable_name = instance.replace('_', ' ')
                object_classes.append(detectable_name)

    print(f"----------detectable object classes------------")
    print(object_classes)  # Should be ['green block', 'yellow block', 'pink block', 'red block', 'robot']
    # Use sgclip's predict_all_relations in detection_only mode
    sgclip_results = predict_all_relations(
        images=images_np,
        object_classes=object_classes, 
        models=models,
        detector_type="dino",
        detection_only=True,  # Skip relationship prediction
    )
    
    print("----------YOLOv8 Object Detection with Prompts (Detection Only)------------")
    print(f"Object detections: {sgclip_results['object_detections']}")
    print(f"Annotated images saved: {sgclip_results['annotated_images_saved']}")
    
    # Move all annotated frames to our output directory
    annotated_frame_paths = []
    frame_idx = 0
    while True:
        frame_file = f"frame_{frame_idx}.png"
        if os.path.exists(frame_file):
            annotated_frame_path = os.path.join(output_dir, f"annotated_frame_{frame_idx}.png")
            shutil.move(frame_file, annotated_frame_path)
            annotated_frame_paths.append(annotated_frame_path)
            print(f"Moved annotated frame to: {annotated_frame_path}")
            frame_idx += 1
        else:
            break
    
    # For backward compatibility, if there's only one frame, also save it as annotated_frame.png
    if len(annotated_frame_paths) == 1:
        shutil.copy(annotated_frame_paths[0], os.path.join(output_dir, "annotated_frame.png"))
    
    # Extract detection results with BBOX information from sgclip batch
    batch = sgclip_results['batch']
    
    print("----------Extracting Objects with BBoxes------------")
    
    print("----------Extracting Objects with BBoxes and Actual Labels------------")
    detected_objects_with_bbox = []

    # Get the actual object labels from sgclip results
    object_detections = sgclip_results['object_detections']
    
    # Get number of frames from images
    num_frames = len(images_np)

    # Extract bboxes from batch data for all frames
    for obj_id, obj_class in batch["object_ids_to_classes"].items():
        # Check each frame for this object
        for frame_idx in range(num_frames):
            if any(obj_id_info[2] == obj_id for obj_id_info in batch["batched_object_ids"] 
                if obj_id_info[1] == frame_idx):
                
                # Extract bbox from batched_pred_bboxes
                bbox = [0, 0, 0, 0]  # Default
                if "batched_pred_bboxes" in batch:
                    for i, (vid, fid, oid) in enumerate(batch["batched_object_ids"]):
                        if vid == 0 and fid == frame_idx and oid == obj_id:
                            if i < len(batch["batched_pred_bboxes"]):
                                bbox_data = batch["batched_pred_bboxes"][i]
                                # Handle different formats: tensor, tuple, or list
                                if hasattr(bbox_data, 'cpu'):
                                    # It's a tensor
                                    bbox = bbox_data.cpu().numpy().tolist()
                                elif isinstance(bbox_data, tuple):
                                    # It's already a tuple from sgclip's mask_to_bbox
                                    bbox = list(bbox_data)
                                elif hasattr(bbox_data, 'tolist'):
                                    # It's a numpy array or other format with tolist
                                    bbox = bbox_data.tolist()
                                else:
                                    # It's already a list or other format
                                    bbox = list(bbox_data) if bbox_data else [0, 0, 0, 0]
                            break
            
                # USE THE ACTUAL LABEL FROM object_detections
                # The annotated image shows labels in format "class (id)" or just "id"
                actual_class = object_detections.get(obj_id, obj_class)  # Get class from detections
                
                # The label shown in the annotated image
                if actual_class and actual_class != f"obj_{obj_id}":
                    # When class is detected, sgclip shows "class (id)"
                    actual_label = f"{actual_class} ({obj_id})"
                else:
                    # When no class detected, just shows the ID
                    actual_label = str(obj_id)
                
                detected_objects_with_bbox.append({
                    'id': obj_id,
                    'name': actual_label,  # The actual label shown in the image (just the ID)
                    'label': actual_label,  # Keep this for compatibility
                    'class': actual_class,   # The class name (block, cube, etc.)
                    'bbox': bbox,
                    'frame_idx': frame_idx
                })

    # Sort by object ID to maintain consistent ordering
    detected_objects_with_bbox.sort(key=lambda x: x['id'])
    
    # Remove duplicates for VLM queries (keep only one instance per object ID)
    # For VLM queries, we only need unique objects, not per-frame instances
    unique_objects_for_vlm = {}
    for obj in detected_objects_with_bbox:
        obj_id = obj['id']
        if obj_id not in unique_objects_for_vlm:
            unique_objects_for_vlm[obj_id] = obj
    
    unique_detected_objects = list(unique_objects_for_vlm.values())
    print(f"Total object instances across frames: {len(detected_objects_with_bbox)}")
    print(f"Unique objects for VLM queries: {len(unique_detected_objects)}")
    
    # Save detection results
    detection_results = {
        'task_name': task_name,
        'timestamp': timestamp,
        'num_frames': num_frames,
        'detected_objects': detected_objects_with_bbox,
        'sgclip_results': {
            'object_detections': sgclip_results['object_detections'],
            'annotated_images_saved': sgclip_results['annotated_images_saved']
        }
    }
    
    with open(os.path.join(output_dir, 'detection_results.json'), 'w') as f:
        json.dump(convert_numpy_types(detection_results), f, indent=2)
    
    # Create observations with the annotated frames for VLM queries
    annotated_observations = observations
    if annotated_frame_paths:
        # Load all annotated frames
        from PIL import Image
        annotated_observations = []
        for path in annotated_frame_paths:
            if os.path.exists(path):
                annotated_frame = Image.open(path)
                annotated_observations.append(annotated_frame)
        print(f"Using {len(annotated_observations)} annotated frame(s) for VLM queries")
    
    # Systematically query VLM for all relationship combinations
    print("----------Systematic VLM Relationship Querying------------")
    
    # todo
    target_relations = {
        'on': 'Looking at the annotated image with bounding boxes, is {obj1} on top of {obj2}? (meaning {obj1} is physically above {obj2} and directly touching it)',
        'ontable': 'Looking at the annotated image with bounding boxes, is {obj} directly touching the table surface? (not stacked on another object)',
        'clear': 'Looking at the annotated image with bounding boxes, is {obj} clear? (meaning there are ZERO objects on top of {obj} - nothing is stacked on it)'
    }
    
    # Store relationship results
    vlm_relationships = {}
    relationship_details = []  # Store detailed VLM responses
    
    # Query binary relationships (on)
    for rel_name, rel_template in target_relations.items():
        if rel_name in ['on']:  # Binary relations
            vlm_relationships[rel_name] = []
            for obj1 in unique_detected_objects:
                for obj2 in unique_detected_objects:
                    if obj1['id'] != obj2['id']:
                        query = rel_template.format(obj1=obj1['label'], obj2=obj2['label'])
                        vlm_response = model.generate(f"{query} Answer only yes or no.", annotated_observations)
                        is_true = "yes" in vlm_response.lower() and "no" not in vlm_response.lower()
                        
                        # Store detailed information
                        relationship_details.append({
                            'relation': rel_name,
                            'objects': [obj1['label'], obj2['label']],
                            'query': query,
                            'vlm_response': vlm_response,
                            'result': is_true
                        })
                        
                        print(f"Query: {query}")
                        print(f"VLM Response: {vlm_response}")
                        print(f"Result: {is_true}")
                        print("---")
                        
                        if is_true:
                            vlm_relationships[rel_name].append((obj1['label'], obj2['label']))
    
    # Query unary relationships (ontable, clear)
    for rel_name, rel_template in target_relations.items():
        if rel_name in ['ontable', 'clear']:  # Unary relations
            vlm_relationships[rel_name] = []
            for obj in unique_detected_objects:
                query = rel_template.format(obj=obj['label'])
                vlm_response = model.generate(f"{query} Answer only yes or no.", annotated_observations)
                is_true = "yes" in vlm_response.lower() and "no" not in vlm_response.lower()
                
                # Store detailed information
                relationship_details.append({
                    'relation': rel_name,
                    'objects': [obj['label']],
                    'query': query,
                    'vlm_response': vlm_response,
                    'result': is_true
                })
                
                print(f"Query: {query}")
                print(f"VLM Response: {vlm_response}")
                print(f"Result: {is_true}")
                print("---")
                
                if is_true:
                    vlm_relationships[rel_name].append(obj['label'])
    
    print("----------VLM Relationship Results------------")
    for rel_name, results in vlm_relationships.items():
        print(f"{rel_name}: {results}")
    
    # Save relationship results to JSON
    relationship_results = {
        'task_name': task_name,
        'timestamp': timestamp,
        'vlm_relationships': vlm_relationships,
        'relationship_details': relationship_details,
        'target_relations': target_relations
    }
    
    with open(os.path.join(output_dir, 'relationship_results.json'), 'w') as f:
        json.dump(convert_numpy_types(relationship_results), f, indent=2)
    
    # Map generic object names (cube0, cube1, etc.) to domain-specific names
    print("----------Mapping Generic Names to Domain Objects------------")
    
    # Get domain object instances
    domain_objects_list = []
    for obj_type, instances in objects.items():
        for instance in instances:
            domain_objects_list.append({'type': obj_type, 'name': instance})
    
    print(f"Domain objects: {[obj['name'] for obj in domain_objects_list]}")
    print(f"Detected objects (all instances): {[obj['label'] for obj in detected_objects_with_bbox]}")
    print(f"Unique objects for VLM: {[obj['label'] for obj in unique_detected_objects]}")
    
    # Ask VLM to map each detected object to domain objects using annotated frame
    # Replace the existing for loop with this global approach
    print("----------Global Object Mapping------------")
    # Get all colors at once
    all_colors_query = f"""Look at all labeled objects in the annotated image.
    For each label (0, 1, 2, etc.), identify its color.
    Domain blocks available: {', '.join([d['name'] for d in domain_objects_list if d['type'] == 'block'])}

    Create a mapping where each label is assigned to the domain block with matching color.
    Ensure each domain block is used exactly once.

    Format: label -> domain-block-name"""

    mapping_response = model.generate(all_colors_query, annotated_observations)
    print(f"Global mapping response:\n{mapping_response}")

    # Parse the response
    object_name_mapping = {}
    import re
    for line in mapping_response.split('\n'):  # Split by newlines
        if '->' in line:
            parts = line.split('->')
            if len(parts) == 2:
                label = parts[0].strip()
                domain_block = parts[1].strip()
                
                # Try to extract just the number from label (e.g., "0" from various formats)
                label_num = re.search(r'\d+', label)
                if label_num:
                    label_num = label_num.group()
                    
                    # Find the detected object with this number
                    for obj in unique_detected_objects:
                        # Check if this object has the same number
                        if f"({label_num})" in obj['label'] or obj['id'] == int(label_num):
                            if domain_block in [d['name'] for d in domain_objects_list]:
                                # Map using the full label format that matches vlm_relationships
                                object_name_mapping[obj['label']] = domain_block
                                break
        
    # Save object mapping results to JSON
    mapping_results = {
        'task_name': task_name,
        'timestamp': timestamp,
        'object_name_mapping': object_name_mapping,
        'mapping_response': mapping_response,
        'domain_objects': [obj['name'] for obj in domain_objects_list],
        'detected_objects': [obj['label'] for obj in detected_objects_with_bbox]
    }
    
    with open(os.path.join(output_dir, 'object_mapping.json'), 'w') as f:
        json.dump(convert_numpy_types(mapping_results), f, indent=2)
    
    # Step 3: Convert VLM relationship results to domain predicates
    step3_start = time.time()
    print("----------Converting VLM Results to Domain Predicates------------")
    
    # Convert VLM relationships to domain predicates using object mapping
    true_grounded_predicates = []
    
    # Handle binary relationships (on)
    if 'on' in vlm_relationships:
        for (generic_obj1, generic_obj2) in vlm_relationships['on']:
            if generic_obj1 in object_name_mapping and generic_obj2 in object_name_mapping:
                domain_obj1 = object_name_mapping[generic_obj1]
                domain_obj2 = object_name_mapping[generic_obj2]
                true_grounded_predicates.append({
                    "name": "on",
                    "args": [domain_obj1, domain_obj2]
                })
                print(f"Added: on({domain_obj1}, {domain_obj2})")
    
    # Handle unary relationships (ontable, clear)
    for rel_name in ['ontable', 'clear']:
        if rel_name in vlm_relationships:
            for generic_obj in vlm_relationships[rel_name]:
                if generic_obj in object_name_mapping:
                    domain_obj = object_name_mapping[generic_obj]
                    true_grounded_predicates.append({
                        "name": rel_name,
                        "args": [domain_obj]
                    })
                    print(f"Added: {rel_name}({domain_obj})")
    
    step3_time = time.time() - step3_start
    print(f"⏱️  Step 3 (VLM Relationship Processing): {step3_time:.2f}s")

    print("----------Final True Predicates------------")
    print(true_grounded_predicates)

    init_states = assemble_grounded_predicates(true_grounded_predicates)

    print("--------------------------------")
    print(object_states)
    print(init_states)

    # Step 4: Generate goal states
    step4_start = time.time()
    goal_prompt = build_goal_prompt(target, config, object_states, init_states)
    goal_response = model.generate(goal_prompt, observations)
    goal_states = "    " + parse_block(goal_response, "(:goal", save_header=True)
    step4_time = time.time() - step4_start
    print(f"⏱️  Step 4 (Goal Generation): {step4_time:.2f}s")

    # Step 5: Assemble final PDDL file
    step5_start = time.time()
    pddl_file = assemble_pddl(object_states, init_states, goal_states, target["domain"])
    step5_time = time.time() - step5_start
    print(f"⏱️  Step 5 (PDDL Assembly): {step5_time:.2f}s")

    # Save the final PDDL file to the output directory
    if task_name:
        with open(os.path.join(output_dir, f"{task_name}.pddl"), 'w') as f:
            f.write(pddl_file)
        print(f"Saved PDDL file to: {os.path.join(output_dir, f'{task_name}.pddl')}")
    
    # Create a comprehensive summary JSON file
    summary_results = {
        'task_name': task_name,
        'timestamp': timestamp,
        'processing_time': {
            'step1_object_detection': step1_time,
            'step2_parsing_predicates': step2_time,
            'step3_vlm_processing': step3_time,
            'step4_goal_generation': step4_time,
            'step5_pddl_assembly': step5_time,
            'total_time': time.time() - start_time
        },
        'detected_objects_count': len(detected_objects_with_bbox),
        'domain_objects_count': len(domain_objects_list),
        'successful_mappings': len(object_name_mapping),
        'final_predicates_count': len(true_grounded_predicates),
        'num_frames': num_frames,
        'files_created': [f for f in [
            *[f'annotated_frame_{i}.png' for i in range(len(annotated_frame_paths))],
            'annotated_frame.png' if len(annotated_frame_paths) == 1 else None,
            'detection_results.json',
            'relationship_results.json',
            'object_mapping.json',
            f'{task_name}.pddl' if task_name else 'problem.pddl',
            'summary.json'
        ] if f is not None],
        'success': True
    }
    
    with open(os.path.join(output_dir, 'summary.json'), 'w') as f:
        json.dump(convert_numpy_types(summary_results), f, indent=2)
    
    print(f"📁 All results saved to: {output_dir}")
    if len(annotated_frame_paths) > 1:
        print(f"   - Annotated frames: {', '.join([f'annotated_frame_{i}.png' for i in range(len(annotated_frame_paths))])}")
    else:
        print(f"   - Annotated image: annotated_frame.png")
    print(f"   - Detection results: detection_results.json")
    print(f"   - Relationship analysis: relationship_results.json")
    print(f"   - Object mapping: object_mapping.json")
    print(f"   - PDDL file: {task_name}.pddl" if task_name else "problem.pddl")
    print(f"   - Summary: summary.json")

    # Overall timing
    total_time = time.time() - start_time
    print(f"\n⏱️  TOTAL TIME: {total_time:.2f}s")
    print(f"   Step 1 (Object Detection): {step1_time:.2f}s ({step1_time/total_time*100:.1f}%)")
    print(f"   Step 2 (Parsing & Building Predicates): {step2_time:.2f}s ({step2_time/total_time*100:.1f}%)")
    print(f"   Step 3 (VLM Relationship Processing): {step3_time:.2f}s ({step3_time/total_time*100:.1f}%)")
    print(f"   Step 4 (Goal Generation): {step4_time:.2f}s ({step4_time/total_time*100:.1f}%)")
    print(f"   Step 5 (PDDL Assembly): {step5_time:.2f}s ({step5_time/total_time*100:.1f}%)")

    all_responses = object_response + "\n\n" + goal_response
    all_prompts = observation_prompt + "\n\n" + goal_prompt
            
    return pddl_file, pddl_file, all_prompts
