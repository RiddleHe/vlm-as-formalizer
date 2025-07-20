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

def seed_everything(seed: int=42):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = True

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

def detect_objects_with_dino(image_path: str, domain_name: str = "blocksworld", box_threshold: float = 0.35):
    import sys
    import torch
    from torchvision.ops import box_convert
    from typing import List
    from collections import defaultdict
    
    # Grounding DINO path
    sys.path.append('/local-ssd/custom_models/GroundingDINO')
    
    try:
        import groundingdino.util.inference as gdino_inference
        import groundingdino.util.vl_utils as gdino_vl_utils
    except ImportError:
        raise ImportError("Grounding DINO not found. Please check installation at /local-ssd/custom_models/GroundingDINO/")

    def get_text_query_simple(domain_name: str):
        if domain_name == "blocksworld":
            text_phrases = [
                "red block", 
                "blue block", 
                "green block", 
                "yellow block", 
                "purple block", 
                "orange block", 
                "pink block", 
            ]
            phrase2object = None
        else:
            text_phrases = ["block", "object", "cube", "item"]
            phrase2object = None
            
        text_query = "".join([phrase + " ." for phrase in text_phrases])
        
        token_spans = []
        for phrase in text_phrases:
            span_list = []
            start = text_query.find(f"{phrase} .")
            for word in phrase.split(" "):
                span_list += [[start, start + len(word)]]
                start += len(word) + 1
            token_spans += [span_list]
            
        return text_query, phrase2object, token_spans

    def get_grounding_output(image, caption, token_spans, model, box_threshold=0.35):
        """Execute Grounding DINO inference"""
        caption = caption.lower().strip()
        image = image.to("cuda")

        with torch.no_grad():
            outputs = model(image[None], captions=[caption])

        logits = outputs["pred_logits"].sigmoid()[0]  
        boxes = outputs["pred_boxes"][0] 

        positive_maps = gdino_vl_utils.create_positive_map_from_span(
            model.tokenizer(caption),
            token_span=token_spans
        ).to("cuda")

        logits_for_phrases = positive_maps @ logits.T 
        all_logits = []
        all_phrases = []
        all_boxes = []
        
        for (token_span, logit_phr) in zip(token_spans, logits_for_phrases):
            phrase = ' '.join([caption[_s:_e] for (_s, _e) in token_span])
            filt_mask = logit_phr > box_threshold
            all_boxes.append(boxes[filt_mask])
            all_logits.append(logit_phr[filt_mask])

            logit_phr_num = logit_phr[filt_mask]
            all_phrases.extend([phrase for _ in logit_phr_num])

        if len(all_boxes) == 0:
            return torch.empty(0, 4), []
            
        boxes_filt = torch.cat(all_boxes, dim=0).cpu()
        pred_phrases = all_phrases

        return boxes_filt, pred_phrases

    def create_bbox_annotations_simple(domain_name: str, boxes, objects, phrases):
        """Simplified bounding box annotation creation"""
        bbox_anns = {}
        
        if len(boxes) == 0:
            return bbox_anns
            
        for i, (obj, box, phrase) in enumerate(zip(objects, boxes, phrases)):
            # Generate unique ID for each object
            obj_clean = phrase.replace(" ", "_").replace(".", "")
            if obj_clean in bbox_anns:
                obj_clean = f"{obj_clean}_{i}"
                
            bbox_anns[obj_clean] = {
                "bbox": box.tolist(),
                "phrase": phrase,
            }
            
        return bbox_anns

    # Main detection logic
    try:
        # 1. Load Grounding DINO model
        model = gdino_inference.load_model(
            "/local-ssd/custom_models/GroundingDINO/groundingdino/config/GroundingDINO_SwinT_OGC.py", 
            "/local-ssd/custom_models/GroundingDINO/weights/groundingdino_swint_ogc.pth",
        ).to("cuda")
        
        # 2. Load and preprocess image
        image_source, image = gdino_inference.load_image(image_path)
        src_w, src_h = image_source.shape[:2]
        
        # 3. Build query text
        text_query, phrase2object, token_spans = get_text_query_simple(domain_name)
        
        # 4. Execute object detection
        boxes, phrases = get_grounding_output(
            image, text_query, token_spans, model, box_threshold=box_threshold
        )
        
        if len(boxes) == 0:
            return {}
        
        # 5. Process detection results
        detected_objects = []
        for phrase in phrases:
            phrase_clean = phrase.replace(" ", "_")
            if phrase2object is not None and phrase_clean in phrase2object:
                detected_objects.append(phrase2object[phrase_clean])
            else:
                detected_objects.append(phrase_clean)

        # 6. Convert coordinate format
        boxes = boxes * torch.Tensor([src_w, src_h, src_w, src_h])
        boxes = box_convert(boxes=boxes, in_fmt="cxcywh", out_fmt="xyxy")
        
        # 7. Create final annotation results
        bbox_anns = create_bbox_annotations_simple(
            domain_name, boxes, detected_objects, phrases
        )
        
        return bbox_anns
        
    except Exception as e:
        print(f"Grounding DINO detection failed: {e}")
        return {}