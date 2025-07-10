#!/usr/bin/env python

import os
import random
import argparse

import numpy as np
import torch
import matplotlib.pyplot as plt
from PIL import Image
from typing import List

def observations_to_images(observations: List[str]) -> List[np.ndarray]:
    """
    Convert a list of image file paths to a list of numpy arrays.
    
    Args:
        observations: List of image file paths (same format as used in generate function)
        
    Returns:
        List of numpy arrays in RGB format, suitable for predict_all_relations
    """
    images = []
    
    for obs_path in observations:
        try:
            # Method 1: Using PIL (recommended for RGB)
            img = Image.open(obs_path)
            if img.mode != 'RGB':
                img = img.convert('RGB')
            img_array = np.array(img)
            images.append(img_array)
            
        except Exception as e:
            print(f"Error loading image {obs_path}: {e}")
            continue
    
    return images

def extract_relation_types(grounded_predicates):
    """
    Extract unique predicate names and categorize them into unary and binary relations.
    
    Args:
        grounded_predicates: List of dictionaries with 'name' and 'args' keys
    
    Returns:
        tuple: (unary_relations, binary_relations) - lists of unique predicate names
    """
    unary_relations = set()
    binary_relations = set()
    
    for predicate in grounded_predicates:
        name = predicate['name']
        args = predicate['args']
        
        # Categorize by arity (number of arguments)
        if len(args) == 1:
            unary_relations.add(name)
        elif len(args) == 2:
            binary_relations.add(name)
    
    # Convert sets to sorted lists for consistent output
    return sorted(list(unary_relations)), sorted(list(binary_relations))

def convert_sgclip_to_relation_preds(sgclip_results, all_grounded_predicates, confidence_threshold=0.5):
    """
    Convert sgclip results to relation_preds format with object mapping and confidence thresholding.
    
    Args:
        sgclip_results: Results from predict_all_relations (sgclip)
        all_grounded_predicates: List of all possible grounded predicates
        confidence_threshold: Minimum confidence to accept a prediction (default: 0.5)
        
    Returns:
        List of boolean values indicating which predicates are true
    """
    print("🔧 DEBUG: Converting sgclip results to relation predictions...")
    print(f"📊 Confidence threshold: {confidence_threshold}")
    
    # Step 1: Extract detected relations with confidence filtering
    detected_relations = set()
    
    # Process unary relations
    unary_data = sgclip_results.get('unary', {})
    if unary_data:
        for frame_id, frame_data in unary_data.items():
            for obj_key, predictions in frame_data.items():
                # obj_key format: "0 (cube)", "1 (cube)", etc.
                obj_id = obj_key.split(' ')[0]  # Extract "0" from "0 (cube)"
                
                for confidence_tensor, relation_name in predictions:
                    confidence = float(confidence_tensor)
                    if confidence >= confidence_threshold:
                        detected_relations.add((relation_name, obj_id))
                        print(f"✅ Unary: {relation_name}({obj_id}) - confidence: {confidence:.3f}")
    
    # Process binary relations with confidence tracking
    binary_candidates = {}  # Track all binary relations with confidence
    binary_data = sgclip_results.get('binary', {})
    if binary_data:
        for frame_id, frame_data in binary_data.items():
            for obj_pair_key, predictions in frame_data.items():
                # obj_pair_key format: ("0 (cube)", "1 (cube)")
                obj1_key, obj2_key = obj_pair_key
                obj1_id = obj1_key.split(' ')[0]  # Extract "0" from "0 (cube)"
                obj2_id = obj2_key.split(' ')[0]  # Extract "1" from "1 (cube)"
                
                for confidence_tensor, relation_name in predictions:
                    confidence = float(confidence_tensor)
                    if confidence >= confidence_threshold:
                        relation_tuple = (relation_name, obj1_id, obj2_id)
                        binary_candidates[relation_tuple] = confidence
                        print(f"🤔 Binary candidate: {relation_name}({obj1_id}, {obj2_id}) - confidence: {confidence:.3f}")
    
    # Step 1.5: Apply physics constraints to resolve conflicts
    print("🔬 Applying physics constraints to resolve conflicts...")
    filtered_binary_relations = apply_physics_constraints(binary_candidates)
    detected_relations.update(filtered_binary_relations)
    
    print(f"🎯 Total detected relations after filtering: {len(detected_relations)}")
    
    # Step 2: Create object mapping (CV IDs to expected names)
    # We need to map detected object IDs (0, 1, 2, 3, 4) to expected object names
    detected_object_ids = set()
    for relation in detected_relations:
        if len(relation) == 2:  # Unary relation
            detected_object_ids.add(relation[1])
        elif len(relation) == 3:  # Binary relation
            detected_object_ids.add(relation[1])
            detected_object_ids.add(relation[2])
    
    # Extract expected object names from grounded predicates
    expected_objects = set()
    for predicate in all_grounded_predicates:
        expected_objects.update(predicate['args'])
    
    print(f"🔍 Detected object IDs: {sorted(detected_object_ids)}")
    print(f"🎯 Expected object names: {sorted(expected_objects)}")
    
    # Create object mapping: detected_id -> expected_name
    object_mapping = create_object_mapping(detected_object_ids, expected_objects)
    print(f"🗺️ Object mapping: {object_mapping}")
    
    # Step 3: Check each grounded predicate against detected relations
    relation_preds = []
    matched_count = 0
    
    for predicate in all_grounded_predicates:
        name = predicate['name']
        args = predicate['args']
        
        is_detected = False
        
        if len(args) == 1:
            # Unary relation: map expected object name to detected ID
            expected_obj = args[0]
            detected_id = reverse_lookup(object_mapping, expected_obj)
            if detected_id and (name, detected_id) in detected_relations:
                is_detected = True
                matched_count += 1
                print(f"✅ MATCH: {name}({expected_obj}) -> {name}({detected_id})")
                
        elif len(args) == 2:
            # Binary relation: map both expected object names to detected IDs
            expected_obj1, expected_obj2 = args
            detected_id1 = reverse_lookup(object_mapping, expected_obj1)
            detected_id2 = reverse_lookup(object_mapping, expected_obj2)
            if detected_id1 and detected_id2 and (name, detected_id1, detected_id2) in detected_relations:
                is_detected = True
                matched_count += 1
                print(f"✅ MATCH: {name}({expected_obj1}, {expected_obj2}) -> {name}({detected_id1}, {detected_id2})")
            
        relation_preds.append(is_detected)
    
    print(f"🎯 Successfully matched {matched_count}/{len(all_grounded_predicates)} predicates")
    return relation_preds

def apply_physics_constraints(binary_candidates):
    """
    Apply physics constraints to resolve conflicting spatial relations.
    
    Args:
        binary_candidates: Dict mapping (relation, obj1, obj2) -> confidence
        
    Returns:
        Set of valid binary relations after constraint resolution
    """
    print("🔬 Resolving spatial relation conflicts...")
    
    # Group relations by type
    on_relations = {}
    other_relations = {}
    
    for (relation_name, obj1, obj2), confidence in binary_candidates.items():
        if relation_name == 'on':
            on_relations[(obj1, obj2)] = confidence
        else:
            other_relations[(relation_name, obj1, obj2)] = confidence
    
    # Resolve "on" relation conflicts
    resolved_on_relations = resolve_on_relation_conflicts(on_relations)
    
    # Combine resolved relations
    final_relations = set()
    
    # Add resolved "on" relations
    for (obj1, obj2) in resolved_on_relations:
        final_relations.add(('on', obj1, obj2))
        print(f"✅ Accepted: on({obj1}, {obj2})")
    
    # Add other relations (no conflicts expected)
    for (relation_name, obj1, obj2) in other_relations:
        final_relations.add((relation_name, obj1, obj2))
        print(f"✅ Accepted: {relation_name}({obj1}, {obj2})")
    
    return final_relations

def resolve_on_relation_conflicts(on_relations):
    """
    Resolve conflicts in "on" relations using physics constraints.
    
    Physics rules:
    1. No mutual "on" relations: If A is on B, then B cannot be on A
    2. Each object can be directly on at most ONE other object
    3. Prefer higher confidence relations
    
    Args:
        on_relations: Dict mapping (obj1, obj2) -> confidence for "on" relations
        
    Returns:
        Set of valid (obj1, obj2) pairs for "on" relations
    """
    print("⚖️ Resolving 'on' relation conflicts...")
    
    if not on_relations:
        return set()
    
    # Sort by confidence (highest first)
    sorted_relations = sorted(on_relations.items(), key=lambda x: x[1], reverse=True)
    
    accepted_relations = set()
    objects_with_support = set()  # Objects that are already on something
    objects_supporting = set()    # Objects that are supporting something
    
    for (obj1, obj2), confidence in sorted_relations:
        # Check constraints
        can_accept = True
        
        # Rule 1: No mutual relations
        if (obj2, obj1) in accepted_relations:
            print(f"❌ Rejected: on({obj1}, {obj2}) - conflicts with on({obj2}, {obj1})")
            can_accept = False
        
        # Rule 2: Each object can only be on one thing
        elif obj1 in objects_with_support:
            print(f"❌ Rejected: on({obj1}, {obj2}) - {obj1} already has support")
            can_accept = False
        
        # Rule 3: Prevent cycles (basic check)
        elif would_create_cycle(accepted_relations, obj1, obj2):
            print(f"❌ Rejected: on({obj1}, {obj2}) - would create cycle")
            can_accept = False
        
        if can_accept:
            accepted_relations.add((obj1, obj2))
            objects_with_support.add(obj1)
            objects_supporting.add(obj2)
            print(f"✅ Accepted: on({obj1}, {obj2}) - confidence: {confidence:.3f}")
    
    return accepted_relations

def would_create_cycle(existing_relations, new_obj1, new_obj2):
    """
    Check if adding on(new_obj1, new_obj2) would create a cycle.
    Simple implementation: check if new_obj2 is transitively on new_obj1.
    """
    # Build transitive closure
    supports = {}  # obj -> set of objects it transitively supports
    for obj1, obj2 in existing_relations:
        if obj2 not in supports:
            supports[obj2] = set()
        supports[obj2].add(obj1)
        
        # Add transitive relations
        if obj1 in supports:
            supports[obj2].update(supports[obj1])
    
    # Check if new_obj2 transitively supports new_obj1
    return new_obj2 in supports and new_obj1 in supports[new_obj2]

def create_object_mapping(detected_ids, expected_objects):
    """
    Create mapping from detected object IDs to expected object names.
    Uses sophisticated heuristics based on colors, positions, and object names.
    """
    detected_list = sorted(detected_ids, key=lambda x: int(x) if x.isdigit() else 0)
    expected_list = sorted(expected_objects)
    
    print(f"🔍 Creating object mapping...")
    print(f"   Detected IDs: {detected_list}")
    print(f"   Expected objects: {expected_list}")
    
    # Strategy 1: Color-based mapping
    color_mapping = try_color_mapping(detected_list, expected_list)
    if color_mapping:
        print(f"✅ Using color-based mapping: {color_mapping}")
        return color_mapping
    
    # Strategy 2: Alphabetical mapping (common for blocksworld)
    alpha_mapping = try_alphabetical_mapping(detected_list, expected_list)
    if alpha_mapping:
        print(f"✅ Using alphabetical mapping: {alpha_mapping}")
        return alpha_mapping
    
    # Strategy 3: Simple index-based mapping (fallback)
    index_mapping = {}
    for i, detected_id in enumerate(detected_list):
        if i < len(expected_list):
            index_mapping[detected_id] = expected_list[i]
    
    print(f"⚡ Using index-based mapping (fallback): {index_mapping}")
    return index_mapping

def try_color_mapping(detected_list, expected_list):
    """
    Try to map objects based on color names in expected object names.
    """
    colors = ['red', 'blue', 'green', 'yellow', 'orange', 'purple', 'pink', 'black', 'white', 'brown']
    
    # Extract colors from expected object names
    object_colors = {}
    for obj in expected_list:
        obj_lower = obj.lower()
        for color in colors:
            if color in obj_lower:
                object_colors[color] = obj
                break
    
    if len(object_colors) >= len(detected_list):
        # We have enough color-identified objects
        color_order = ['red', 'blue', 'green', 'yellow', 'orange', 'purple', 'pink', 'black', 'white', 'brown']
        available_colors = [c for c in color_order if c in object_colors]
        
        mapping = {}
        for i, detected_id in enumerate(detected_list):
            if i < len(available_colors):
                color = available_colors[i]
                mapping[detected_id] = object_colors[color]
        
        return mapping if len(mapping) == len(detected_list) else None
    
    return None

def try_alphabetical_mapping(detected_list, expected_list):
    """
    Try to map objects alphabetically - good for systematic naming.
    """
    # Sort both lists to ensure consistent mapping
    sorted_detected = sorted(detected_list, key=lambda x: int(x) if x.isdigit() else 0)
    sorted_expected = sorted(expected_list)
    
    if len(sorted_detected) <= len(sorted_expected):
        mapping = {}
        for i, detected_id in enumerate(sorted_detected):
            mapping[detected_id] = sorted_expected[i]
        return mapping
    
    return None

def reverse_lookup(mapping, value):
    """Find key for a given value in mapping dictionary."""
    for key, val in mapping.items():
        if val == value:
            return key
    return None

def seed_everything(seed: int=42):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = True


def parse_args():
    parser = argparse.ArgumentParser()

    # Data dirs
    parser.add_argument("--result_dir", type=str, default=None, help="direcotry for predicted bboxes, generated problems, and found plans")
    parser.add_argument("--domain", type=str, default=None, help="domain name (cooking/blocksworld/hanoi)")

    # Model args
    parser.add_argument("--model", type=str, default=None, help="model name")
    parser.add_argument("--device", type=str, default="cuda:0", help="device")

    parser.add_argument("--find_plan", action="store_true", default=True, help="refine generated problems by corrective reprompting")

    # Main generation choices
    parser.add_argument("--generate_end_to_end", action="store_true", help="generate PDDL end-to-end")
    parser.add_argument("--generate_multi_step", action="store_true", help="generate scene graph first")

    # Planning baseline
    parser.add_argument("--generate_plan", action="store_true", help="generate end-to-end plans")

    # If choose generate_end_to_end
    parser.add_argument("--generate_caption", action="store_true", help="generate caption for observation")
    parser.add_argument("--generate_scene_graph", action="store_true", help="generate scene graph for observation")
    parser.add_argument("--enable_caption", action="store_true", default=False, help="Enable captioning for the observation")

    # If choose generate_multi_step
    parser.add_argument("--generate_from_vlm", action="store_true", help="generate from VLM")
    parser.add_argument("--generate_from_cv_model", action="store_true", help="generate from CV model")

    parser.add_argument("--clean_image", action="store_true", default=False, help="Present a clean image to the model")

    # Runtime config
    parser.add_argument("--num_tries", type=int, default=3, help="the number of tries for each generation stage")

    # Downward solver
    parser.add_argument("--downward_dir", type=str, default="/home/mh3897/pddl/villain/downward", help="")
    parser.add_argument("--time_limit", type=int, default=30, help="")

    # related to problem generation and refinement
    parser.add_argument("--seed", type=int, default=42, help="random seed")
    parser.add_argument("--gen_step", type=str, default="base", help="PDDL generation step")
    parser.add_argument("--prev_gen_step", type=str, default="base", help="Previous generation step, used for corrective reprompting")
    parser.add_argument("--num_examples", type=int, default=1, help="the numebr of examples for few-shot prompting")
    parser.add_argument("--num_repeat", type=int, default=1, help="the number of problems to generate per task")
    parser.add_argument("--refine_all", action="store_true", help="refine all problems regardless of errors")
    args = parser.parse_args()

    return args

def format_command(domain_path, problem_path, plan_path, downward_dir, time_limit):
    sas_path = f"{plan_path}.sas"

    command = f"python {downward_dir}/fast-downward.py " + \
                f"--alias lama " + \
                f"--search-time-limit {time_limit} " + \
                f"--plan-file {plan_path} " + \
                f"--sas-file {sas_path} " + \
                f"{domain_path} " + \
                f"{problem_path}"

    return command

def create_file_paths(domain_str, problem_str, temp_dir_path):
    domain_path = f"{temp_dir_path}/domain.pddl"
    problem_path = f"{temp_dir_path}/problem.pddl"
    with open(domain_path, "w") as fw:
        fw.write(domain_str)
    with open(problem_path, "w") as fw:
        fw.write(problem_str)

    plan_base_name = f"output_plan"
    plan_path = f"{temp_dir_path}/{plan_base_name}"

    return domain_path, problem_path, plan_path

# Visualization

def get_color(obj_id, cmap_name="gist_rainbow", alpha=0.5):
    cmap = plt.get_cmap(cmap_name)
    color = list(cmap((obj_id * 47) % 256))
    color[3] = alpha
    return np.array(color)

def highlight(mask, ax, obj_id=None, det_class=None, random_color=False, show_bbox=False, show_masks=True):
    if random_color:
        color = np.concatenate([np.random.random(3), np.array([0.8])], axis=0)
    else:
        color = get_color(obj_id)

    if show_masks:
        mask_image = np.zeros((mask.shape[0], mask.shape[1], 4), dtype=float)
        mask_image[mask[..., 0] > 0] = color

    y_indices, x_indices = np.where(mask[..., 0] > 0)
    if y_indices.size == 0 or x_indices.size == 0:
        if show_masks:
            ax.imshow(mask_image, alpha=0.5)
        return

    x_min, x_max = x_indices.min(), x_indices.max()
    y_min, y_max = y_indices.min(), y_indices.max()

    if det_class:
        show_bbox = True

    if show_bbox:
        rect = plt.Rectangle(
            (x_min, y_min),
            x_max - x_min,
            y_max - y_min,
            linewidth=1.5,
            edgecolor=color[:3],
            facecolor="none",
        )
        ax.add_patch(rect)

    if det_class is not None:
        label = f"{det_class} ({obj_id})"
        ax.text(
            x_min,
            y_min - 5,
            label,
            color="white",
            fontsize=8,
            backgroundcolor=color,
        )
    
    if show_masks:
        ax.imshow(mask_image, alpha=0.5)

def visualize_predictions(images, video_segments, oid_to_class, save_dir, show_masks=True):
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)

    for frame_id, image in enumerate(images):
        if frame_id not in video_segments:
            continue

        fig, ax = plt.subplots(1, figsize=(10, 10))
        ax.imshow(image)
        ax.axis("off")

        frame_masks = video_segments[frame_id]
        for obj_id, mask_tensor in sorted(frame_masks.items()):
            mask_np = mask_tensor.permute(1, 2, 0).cpu().numpy()
            class_name = oid_to_class.get(obj_id, f"obj_{obj_id}")
            highlight(mask_np, ax, obj_id=obj_id, det_class=class_name, show_masks=show_masks)

        save_path = os.path.join(save_dir, f"frame_{frame_id}.png")
        plt.savefig(save_path, bbox_inches="tight")
        plt.close(fig)
        print(f"Saved visualization for frame {frame_id} to {save_path}")