
import itertools
import os
import sys
import numpy as np
import torch

def convert_numpy_types(obj):
    """Recursively convert numpy and torch types to Python native types for JSON serialization"""
    if isinstance(obj, dict):
        # Convert tuple keys to strings for JSON compatibility
        new_dict = {}
        for key, value in obj.items():
            if isinstance(key, tuple):
                new_key = str(key)  # Convert tuple to string
            else:
                new_key = convert_numpy_types(key)
            new_dict[new_key] = convert_numpy_types(value)
        return new_dict
    elif isinstance(obj, list):
        return [convert_numpy_types(item) for item in obj]
    elif isinstance(obj, tuple):
        return [convert_numpy_types(item) for item in obj]  # Convert tuple to list
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
from ..helpers import observations_to_images, extract_relation_types, convert_sgclip_to_relation_preds

def generate_multi_step_with_sgclip_vlm(
    target,
    config,
    model,
    observations,
    retry_idx,
    result_dir=None,
    save_step=None,
    task_name=None,
    generate_from_vlm=True,
    generate_from_cv_model=False,
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
    
    # Setup output directory
    from datetime import datetime
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
    
    observation_prompt = build_observation_prompt(target, config)
    # print(observation_prompt)
    object_response, past_key_values = model.generate(observation_prompt, observations, return_cache=True)

    print("--------------------------------")
    print(object_response)

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

        # TODO: add support for arbitrary num of args
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

    print("----------predicate strings------------")
    print(all_predicate_strs)

    relation_prompt_template = "Is {relation} (Answer only yes/no)"
    relation_prompts = list(map(
        lambda x: relation_prompt_template.format(relation=x), all_predicate_strs
    ))

    print("----------relation prompts------------")
    print(relation_prompts)

    # Use sgclip for relation prediction instead of VLM
    print("----------Using sgclip for relation prediction------------")

    # Setup sgclip models
    import os
    BASE_DIR = os.path.join(os.path.dirname(__file__), "..", "..")
    DEVICE = "cuda"
    sgclip_models = setup_and_load_models(BASE_DIR, DEVICE, detector_type="dino")

    object_classes = []
    for obj_class in objects.keys():
        if objects[obj_class]:  # Only include classes that have instances
            for instance in objects[obj_class]:
                # Remove underscores for DINO detection
                detectable_name = instance.replace('_', ' ')
                object_classes.append(detectable_name)

    print(f"----------detectable object classes------------")
    print(object_classes)  # Should be ['green block', 'yellow block', 'pink block', 'red block', 'robot']


    # Use sgclip to predict all relations
    sgclip_results = predict_all_relations(
        images=images,
        object_classes=object_classes,
        unary_relations=unary_relations,
        binary_relations=binary_relations,
        models=sgclip_models,
        detector_type="dino",
    )

    print("----------sgclip results------------")
    print(sgclip_results)

    # Save visualization images with bounding boxes to organized directory
    
    # Lower threshold for more permissive matching, higher threshold for stricter matching
    confidence_threshold = 0.3  # Accept relations with 30%+ confidence for more coverage
    
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
    
    
    
    relation_preds = convert_sgclip_to_relation_preds(
        sgclip_results, 
        all_grounded_predicates, 
        confidence_threshold=confidence_threshold
    )

    print("----------conversion results------------")
    print(f"Total grounded predicates: {len(all_grounded_predicates)}")
    print(f"True predictions: {sum(relation_preds)}")
    print(f"Acceptance rate: {sum(relation_preds)/len(relation_preds)*100:.1f}%")

    true_grounded_predicates = [
        pred for pred, is_true in zip(all_grounded_predicates, relation_preds) if is_true
    ]

    print("----------final true predicates------------")
    print(true_grounded_predicates)

    init_states = assemble_grounded_predicates(true_grounded_predicates)

    print("--------------------------------")
    print(object_states)
    print(init_states)

    goal_prompt = build_goal_prompt(target, config, object_states, init_states)

    # print("--------------------------------")
    # print(goal_prompt)

    goal_response = model.generate(goal_prompt, observations)

    # print("--------------------------------")
    # print(goal_response)    

    goal_states = "    " + parse_block(goal_response, "(:goal", save_header=True)

    # print("--------------------------------")
    # print(goal_states)

    pddl_file = assemble_pddl(object_states, init_states, goal_states, target["domain"])

    # print("--------------------------------")
    # print(pddl_file)

    # Save intermediate results
    # Save sgclip results
    sgclip_results_data = {
        'task_name': task_name,
        'timestamp': timestamp,
        'sgclip_results': sgclip_results,
        'confidence_threshold': confidence_threshold,
        'true_grounded_predicates': true_grounded_predicates,
        'acceptance_rate': sum(relation_preds)/len(relation_preds)*100 if relation_preds else 0
    }
    
    with open(os.path.join(output_dir, 'sgclip_results.json'), 'w') as f:
        json.dump(convert_numpy_types(sgclip_results_data), f, indent=2)
    
    # Save the final PDDL file to the output directory
    if task_name:
        with open(os.path.join(output_dir, f"{task_name}.pddl"), 'w') as f:
            f.write(pddl_file)
        print(f"Saved PDDL file to: {os.path.join(output_dir, f'{task_name}.pddl')}")
    
    # Create a comprehensive summary JSON file
    summary_results = {
        'task_name': task_name,
        'timestamp': timestamp,
        'num_frames': len(annotated_frame_paths),
        'total_grounded_predicates': len(all_grounded_predicates),
        'true_predictions': sum(relation_preds),
        'acceptance_rate': sum(relation_preds)/len(relation_preds)*100 if relation_preds else 0,
        'confidence_threshold': confidence_threshold,
        'files_created': [f for f in [
            *[f'annotated_frame_{i}.png' for i in range(len(annotated_frame_paths))],
            'sgclip_results.json',
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
    elif len(annotated_frame_paths) == 1:
        print(f"   - Annotated image: annotated_frame_0.png")
    print(f"   - SGCLIP results: sgclip_results.json")
    print(f"   - PDDL file: {task_name}.pddl" if task_name else "problem.pddl")
    print(f"   - Summary: summary.json")

    all_responses = object_response + "\n\n" + goal_response
    all_prompts = observation_prompt + "\n\n" + goal_prompt

    return pddl_file, pddl_file, all_prompts