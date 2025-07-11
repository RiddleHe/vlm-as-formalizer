#!/usr/bin/env python

import os
import random
import argparse

import numpy as np
import torch
import matplotlib.pyplot as plt
from PIL import Image
from typing import List

import itertools
import numpy as np
import matplotlib.pyplot as plt
from scipy.spatial.distance import cdist
try:
    from sklearn.cluster import KMeans
    SKLEARN_AVAILABLE = True
except ImportError:
    SKLEARN_AVAILABLE = False
    print("⚠️ sklearn not available, using fallback color analysis")
from collections import Counter
import cv2

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

def try_color_mapping(detected_list, expected_list):
    """
    Try to map objects based on color names in expected object names (heuristic fallback).
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

def convert_sgclip_to_relation_preds(sgclip_results, all_grounded_predicates, confidence_threshold=0.5, images=None, batch=None):
    """
    Convert sgclip results to relation_preds format with object mapping and confidence thresholding.
    
    Args:
        sgclip_results: Results from predict_all_relations (sgclip)
        all_grounded_predicates: List of all possible grounded predicates
        confidence_threshold: Minimum confidence to accept a prediction (default: 0.5)
        images: List of images for color analysis (optional)
        batch: Object detection batch for color analysis (optional)
        
    Returns:
        List of boolean values indicating which predicates are true
    """
    print("🔧 DEBUG: Converting sgclip results to relation predictions...")
    print(f"📊 Confidence threshold: {confidence_threshold}")
    
    # Step 1: Extract detected relations with confidence filtering
    detected_relations = set()
    
    # Process unary relations (temporarily store them)
    unary_candidates = {}  # Track all unary relations with confidence
    unary_data = sgclip_results.get('unary', {})
    if unary_data:
        for frame_id, frame_data in unary_data.items():
            for obj_key, predictions in frame_data.items():
                # obj_key format: "0 (cube)", "1 (cube)", etc.
                obj_id = obj_key.split(' ')[0]  # Extract "0" from "0 (cube)"
                
                for confidence_tensor, relation_name in predictions:
                    confidence = float(confidence_tensor)
                    if confidence >= confidence_threshold:
                        relation_tuple = (relation_name, obj_id)
                        unary_candidates[relation_tuple] = confidence
                        print(f"🤔 Unary candidate: {relation_name}({obj_id}) - confidence: {confidence:.3f}")
    
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
    
    # Step 1.6: Apply physics constraints to unary relations
    print("🔬 Applying physics constraints to unary relations...")
    filtered_unary_relations = apply_unary_physics_constraints(unary_candidates, filtered_binary_relations)
    detected_relations.update(filtered_unary_relations)
    
    print(f"🎯 Total detected relations after filtering: {len(detected_relations)}")
    
    # Step 2: Create object mapping (CV IDs to expected names)
    # We need to map detected object IDs (0, 1, 2, 3, 4) to expected object names
    detected_object_ids = set()
    
    # First, get all object IDs from the batch (regardless of relations)
    if batch and "batched_object_ids" in batch:
        for vid, fid, oid in batch["batched_object_ids"]:
            detected_object_ids.add(str(oid))  # Ensure string format
    
    # Also add object IDs from detected relations (if any)
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
    
    # Analyze object colors if images and batch are provided
    object_colors = None
    if images and batch:
        try:
            object_colors = analyze_object_colors(images, batch)
        except Exception as e:
            print(f"⚠️ Color analysis failed: {e}")
    
    # Create object mapping: detected_id -> expected_name
    object_mapping = create_object_mapping(detected_object_ids, expected_objects, object_colors)
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

def apply_unary_physics_constraints(unary_candidates, accepted_binary_relations):
    """
    Apply physics constraints to unary relations based on accepted binary relations.
    
    Physics rules:
    1. If an object is "on" another object, it should NOT be "ontable"
    2. Only objects that are not stacked on anything should be "ontable"
    
    Args:
        unary_candidates: Dict mapping (relation, obj) -> confidence for unary relations
        accepted_binary_relations: Set of accepted binary relations from apply_physics_constraints
        
    Returns:
        Set of valid unary relations after constraint resolution
    """
    print("⚖️ Filtering unary relations based on binary relations...")
    
    # Find objects that are "on" something else
    objects_with_support = set()
    for relation_tuple in accepted_binary_relations:
        if len(relation_tuple) == 3 and relation_tuple[0] == 'on':
            # relation_tuple format: ('on', obj1, obj2) means obj1 is on obj2
            obj1 = relation_tuple[1]
            objects_with_support.add(obj1)
    
    print(f"📋 Objects with support (should NOT be ontable): {sorted(objects_with_support)}")
    
    # Filter unary relations
    filtered_unary_relations = set()
    
    for (relation_name, obj), confidence in unary_candidates.items():
        can_accept = True
        
        # Physics rule: objects that are "on" something else cannot be "ontable"
        if relation_name == 'ontable' and obj in objects_with_support:
            print(f"❌ Rejected: ontable({obj}) - object is already on something else")
            can_accept = False
        
        if can_accept:
            filtered_unary_relations.add((relation_name, obj))
            print(f"✅ Accepted: {relation_name}({obj}) - confidence: {confidence:.3f}")
    
    return filtered_unary_relations

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

def extract_dominant_color(image, mask):
    """
    Extract the dominant color from a masked region of an image.
    Enhanced version that filters out background pixels and uses better color analysis.
    
    Args:
        image: RGB image array (H, W, 3)
        mask: Binary mask array (H, W, 1) or (H, W, 3)
    
    Returns:
        tuple: (dominant_color_rgb, color_name)
    """
    # Handle different mask formats
    if len(mask.shape) == 3:
        mask = mask[:, :, 0]  # Take first channel if 3D
    
    # Get pixels where mask is True
    masked_pixels = image[mask > 0]
    
    if len(masked_pixels) == 0:
        return (0, 0, 0), "unknown"
    
    # Filter out very dark pixels (likely background/shadows)
    # In blocksworld dataset, actual objects have some color, background is very dark
    brightness_threshold = 60  # Pixels with all RGB values < 60 are likely background
    bright_pixels = masked_pixels[np.sum(masked_pixels, axis=1) > brightness_threshold]
    
    if len(bright_pixels) == 0:
        # If no bright pixels, use the brightest pixels available
        brightness_scores = np.sum(masked_pixels, axis=1)
        top_20_percent = int(len(masked_pixels) * 0.2)
        brightest_indices = np.argsort(brightness_scores)[-top_20_percent:]
        bright_pixels = masked_pixels[brightest_indices]
    
    # Use K-means to find dominant color if sklearn is available
    if SKLEARN_AVAILABLE and len(bright_pixels) > 5:
        try:
            # Use more clusters to better capture the object color
            n_clusters = min(3, len(bright_pixels))
            kmeans = KMeans(n_clusters=n_clusters, random_state=42, n_init=10)
            kmeans.fit(bright_pixels)
            
            # Get the cluster with the most pixels (dominant color)
            cluster_labels = kmeans.labels_
            cluster_counts = np.bincount(cluster_labels)
            dominant_cluster = np.argmax(cluster_counts)
            dominant_color = kmeans.cluster_centers_[dominant_cluster]
            
            dominant_color = tuple(map(int, dominant_color))
        except:
            # Fallback to median color (more robust than mean for outliers)
            dominant_color = tuple(map(int, np.median(bright_pixels, axis=0)))
    else:
        # Fallback to median color (more robust than mean for outliers)
        dominant_color = tuple(map(int, np.median(bright_pixels, axis=0)))
    
    # Convert RGB to color name
    color_name = rgb_to_color_name(dominant_color)
    
    return dominant_color, color_name

def rgb_to_color_name(rgb):
    """
    Convert RGB values to human-readable color names.
    Blocksworld-specific color ranges based on actual dataset analysis.
    
    Args:
        rgb: Tuple of (R, G, B) values
    
    Returns:
        str: Color name
    """
    # Define color ranges based on actual blocksworld dataset analysis
    # Updated with real RGB values from log analysis
    color_ranges = {
        'red': [(100, 10, 0), (200, 50, 30)],       # Covers (130, 15, 8), (141, 22, 6), (124, 21, 8)
        'green': [(0, 15, 0), (40, 80, 30)],        # Covers (0, 20, 4), (1, 23, 0) but excludes purple
        'yellow': [(140, 100, 0), (255, 220, 100)], # Bright yellow blocks
        'orange': [(140, 70, 10), (200, 120, 50)],  # Orange blocks
        'purple': [(40, 15, 20), (120, 80, 100)],   # Covers (59, 27, 43), (68, 31, 49) - EXPANDED
        'pink': [(160, 70, 80), (255, 180, 200)],   # Covers (181, 76, 99), (170, 73, 94)
        'blue': [(0, 40, 100), (50, 80, 150)],      # Dark blue blocks
        'brown': [(80, 40, 20), (140, 80, 60)],     # Brown blocks (but map to purple if needed)
        'black': [(0, 0, 0), (50, 50, 50)],         # Very dark blocks
        'white': [(200, 200, 200), (255, 255, 255)], # Light blocks
    }
    
    # Check each color range
    for color, (min_rgb, max_rgb) in color_ranges.items():
        if all(min_rgb[i] <= rgb[i] <= max_rgb[i] for i in range(3)):
            # Special case: if detected as brown but could be purple, prefer purple
            if color == 'brown':
                # Check if it's closer to purple range
                purple_min, purple_max = color_ranges['purple']
                if all(purple_min[i] <= rgb[i] <= purple_max[i] for i in range(3)):
                    return 'purple'
            return color
    
    # Fallback for unmapped colors - use similarity
    distances = {}
    for color, (min_rgb, max_rgb) in color_ranges.items():
        # Calculate distance to center of range
        center_rgb = [(min_rgb[i] + max_rgb[i]) / 2 for i in range(3)]
        distance = sum((rgb[i] - center_rgb[i])**2 for i in range(3)) ** 0.5
        distances[color] = distance
    
    # Return closest color
    closest_color = min(distances, key=distances.get)
    
    # Special logic for dark colors that might be purple
    if sum(rgb) < 150 and rgb[0] >= rgb[1] and rgb[2] >= rgb[1]:  # Dark with red/blue > green
        return 'purple'
    
    return closest_color

def analyze_object_colors(images, batch):
    """
    Analyze the actual colors of detected objects using computer vision.
    
    Args:
        images: List of RGB images
        batch: Object detection batch with masks and bounding boxes
    
    Returns:
        dict: Mapping from object_id to detected color name
    """
    object_colors = {}
    
    print("🎨 Analyzing object colors using computer vision...")
    
    for i, (vid, fid, oid) in enumerate(batch["batched_object_ids"]):
        if fid < len(images):
            image = images[fid]
            mask = batch["batched_pred_masks"][i]
            
            # Extract dominant color
            dominant_rgb, color_name = extract_dominant_color(image, mask)
            object_colors[oid] = color_name
            
            # Debug: show mask statistics
            mask_2d = mask[:, :, 0] if len(mask.shape) == 3 else mask
            total_pixels = np.sum(mask_2d > 0)
            if total_pixels > 0:
                all_pixels = image[mask_2d > 0]
                min_rgb = np.min(all_pixels, axis=0)
                max_rgb = np.max(all_pixels, axis=0)
                avg_rgb = np.mean(all_pixels, axis=0)
                
                print(f"  Object {oid}: ")
                print(f"    Mask pixels: {total_pixels}")
                print(f"    RGB range: min={tuple(min_rgb)}, max={tuple(max_rgb)}")
                print(f"    Average RGB: {tuple(map(int, avg_rgb))}")
                print(f"    Dominant RGB: {dominant_rgb}")
                print(f"    Detected color: {color_name}")
            else:
                print(f"  Object {oid}: No mask pixels found")
    
    return object_colors

def create_object_mapping(detected_ids, expected_objects, object_colors=None):
    """
    Create mapping from detected object IDs to expected object names.
    Uses sophisticated heuristics based on colors, positions, and object names.
    """
    detected_list = sorted(detected_ids, key=lambda x: int(x) if x.isdigit() else 0)
    expected_list = sorted(expected_objects)
    
    print(f"🔍 Creating object mapping...")
    print(f"   Detected IDs: {detected_list}")
    print(f"   Expected objects: {expected_list}")
    if object_colors:
        print(f"   Detected colors: {object_colors}")
    
    # Strategy 1: Computer vision-based color mapping
    if object_colors:
        cv_color_mapping = try_cv_color_mapping(detected_list, expected_list, object_colors)
        if cv_color_mapping:
            print(f"✅ Using CV-based color mapping: {cv_color_mapping}")
            return cv_color_mapping
    
    # Strategy 2: Heuristic color-based mapping (fallback)
    color_mapping = try_color_mapping(detected_list, expected_list)
    if color_mapping:
        print(f"⚠️  Using heuristic color mapping: {color_mapping}")
        return color_mapping
    
    # Strategy 3: Alphabetical mapping (common for blocksworld)
    alpha_mapping = try_alphabetical_mapping(detected_list, expected_list)
    if alpha_mapping:
        print(f"✅ Using alphabetical mapping: {alpha_mapping}")
        return alpha_mapping
    
    # Strategy 4: Simple index-based mapping (fallback)
    index_mapping = {}
    for i, detected_id in enumerate(detected_list):
        if i < len(expected_list):
            index_mapping[detected_id] = expected_list[i]
    
    print(f"⚡ Using index-based mapping (fallback): {index_mapping}")
    return index_mapping

def try_cv_color_mapping(detected_list, expected_list, object_colors):
    """
    Try to map objects based on computer vision color analysis.
    """
    print("🎨 Attempting CV-based color mapping...")
    
    # Extract colors from expected object names
    expected_colors = {}
    colors = ['red', 'blue', 'green', 'yellow', 'orange', 'purple', 'pink', 'black', 'white', 'brown', 'gray']
    
    for obj in expected_list:
        obj_lower = obj.lower()
        for color in colors:
            if color in obj_lower:
                expected_colors[color] = obj
                break
    
    print(f"  Expected colors: {expected_colors}")
    
    # Try to match detected colors to expected colors
    mapping = {}
    used_objects = set()
    
    for detected_id in detected_list:
        # Fix type mismatch: convert detected_id to int for object_colors lookup
        detected_id_int = int(detected_id) if detected_id.isdigit() else detected_id
        
        if detected_id_int in object_colors:
            detected_color = object_colors[detected_id_int]
            
            print(f"  🔍 Checking object {detected_id} (color: {detected_color})")
            
            # Direct match
            if detected_color in expected_colors and expected_colors[detected_color] not in used_objects:
                mapping[detected_id] = expected_colors[detected_color]
                used_objects.add(expected_colors[detected_color])
                print(f"  ✅ Direct match: {detected_id} ({detected_color}) -> {expected_colors[detected_color]}")
            else:
                # Try color similarity mapping
                best_match = find_similar_color_match(detected_color, expected_colors, used_objects)
                if best_match:
                    mapping[detected_id] = best_match
                    used_objects.add(best_match)
                    print(f"  🔄 Similar match: {detected_id} ({detected_color}) -> {best_match}")
                else:
                    print(f"  ❌ No match found for {detected_id} ({detected_color})")
        else:
            print(f"  ⚠️ Object {detected_id} not found in color analysis")
    
    # Check if we successfully mapped enough objects (partial success is OK)
    if len(mapping) >= len(detected_list) * 0.5:  # Accept if we mapped at least 50% of objects
        print(f"  ✅ CV color mapping successful: {len(mapping)}/{len(detected_list)} objects mapped")
        
        # For unmapped objects, try to assign remaining colors
        remaining_objects = [obj for obj in expected_colors.values() if obj not in used_objects]
        unmapped_ids = [detected_id for detected_id in detected_list if detected_id not in mapping]
        
        for i, detected_id in enumerate(unmapped_ids):
            if i < len(remaining_objects):
                mapping[detected_id] = remaining_objects[i]
                print(f"  🔄 Fallback assignment: {detected_id} -> {remaining_objects[i]}")
        
        return mapping
    
    print(f"  ❌ CV color mapping incomplete: {len(mapping)}/{len(detected_list)} objects mapped")
    return None

def find_similar_color_match(detected_color, expected_colors, used_objects):
    """
    Find the most similar color match for a detected color.
    Updated for blocksworld with better color similarity mappings.
    """
    color_similarity = {
        'red': ['orange', 'pink', 'brown'],
        'blue': ['purple'],
        'green': ['yellow'],
        'yellow': ['orange', 'green'],
        'orange': ['red', 'yellow', 'brown'],
        'purple': ['blue', 'pink', 'brown'],  # Purple similar to brown
        'pink': ['red', 'purple'],
        'brown': ['purple', 'red', 'orange'],   # Brown -> purple (common misclassification)
        # Map problematic colors to blocksworld equivalents
        'black': ['purple', 'red', 'green', 'blue'],  # Very dark colors
        'gray': ['purple', 'blue'],                   # Gray -> cooler colors
        'white': ['yellow', 'pink'],                  # Light colors
    }
    
    # Try similar colors in order of preference
    similar_colors = color_similarity.get(detected_color, [])
    
    for similar_color in similar_colors:
        if similar_color in expected_colors:
            candidate_obj = expected_colors[similar_color]
            if candidate_obj not in used_objects:
                return candidate_obj
    
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