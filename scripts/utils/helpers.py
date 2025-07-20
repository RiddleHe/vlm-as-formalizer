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

def convert_sgclip_to_relation_preds(sgclip_results, all_grounded_predicates, confidence_threshold=0.5):
    """
    Convert sgclip results to relation_preds format with direct color-based object mapping.
    
    Args:
        sgclip_results: Results from predict_all_relations (sgclip) with colored object detection
        all_grounded_predicates: List of all possible grounded predicates
        confidence_threshold: Minimum confidence to accept a prediction (default: 0.5)
        
    Returns:
        List of boolean values indicating which predicates are true
    """
    print("🔧 DEBUG: Converting sgclip results to relation predictions...")
    print(f"📊 Confidence threshold: {confidence_threshold}")
    
    # Step 1: Extract detected relations with confidence filtering
    detected_relations = set()
    
    # Step 2: Create object mapping directly from sgclip colored detections
    object_mapping = {}  # Maps obj_id -> domain_object_name
    
    # Extract expected object names from grounded predicates
    expected_objects = set()
    for predicate in all_grounded_predicates:
        expected_objects.update(predicate['args'])
    
    print(f"🎯 Expected object names: {sorted(expected_objects)}")
    
    # Process unary relations and build object mapping
    unary_data = sgclip_results.get('unary', {})
    if unary_data:
        for frame_id, frame_data in unary_data.items():
            for obj_key, predictions in frame_data.items():
                # obj_key format: "0 (green block)", "1 (pink block)", etc.
                if '(' in obj_key and ')' in obj_key:
                    obj_id = obj_key.split(' (')[0]  # Extract "0" 
                    color_class = obj_key.split(' (')[1].split(')')[0]  # Extract "green block"
                    
                    # Convert "green block" to "green_block" to match domain format
                    domain_name = color_class.replace(' ', '_')
                    if domain_name in expected_objects:
                        object_mapping[obj_id] = domain_name
                        print(f"🗺️ Mapped: {obj_id} ({color_class}) -> {domain_name}")
                    else:
                        # Try exact match without conversion
                        if color_class in expected_objects:
                            object_mapping[obj_id] = color_class
                            print(f"🗺️ Mapped (exact): {obj_id} ({color_class}) -> {color_class}")
                        else:
                            print(f"⚠️ No match for {color_class} -> {domain_name} in {expected_objects}")
                
                # Process relation predictions
                obj_id = obj_key.split(' ')[0] if '(' in obj_key else obj_key
                for confidence_tensor, relation_name in predictions:
                    confidence = float(confidence_tensor)
                    if confidence >= confidence_threshold:
                        relation_tuple = (relation_name, obj_id)
                        detected_relations.add(relation_tuple)
                        print(f"✅ Unary relation: {relation_name}({obj_id}) - confidence: {confidence:.3f}")
    
    # Process binary relations
    binary_data = sgclip_results.get('binary', {})
    if binary_data:
        for frame_id, frame_data in binary_data.items():
            for obj_pair_key, predictions in frame_data.items():
                # obj_pair_key format: ("0 (green block)", "1 (pink block)")
                obj1_key, obj2_key = obj_pair_key
                
                # Extract object IDs and update mapping
                for obj_key in [obj1_key, obj2_key]:
                    if '(' in obj_key and ')' in obj_key:
                        obj_id = obj_key.split(' (')[0]  # Extract "0"
                        color_class = obj_key.split(' (')[1].split(')')[0]  # Extract "green block"
                        
                        # Convert "green block" to "green_block" to match domain format
                        domain_name = color_class.replace(' ', '_')
                        if domain_name in expected_objects:
                            object_mapping[obj_id] = domain_name
                        elif color_class in expected_objects:
                            object_mapping[obj_id] = color_class
                
                obj1_id = obj1_key.split(' ')[0] if '(' in obj1_key else obj1_key
                obj2_id = obj2_key.split(' ')[0] if '(' in obj2_key else obj2_key
                
                # Process relation predictions
                for confidence_tensor, relation_name in predictions:
                    confidence = float(confidence_tensor)
                    if confidence >= confidence_threshold:
                        relation_tuple = (relation_name, obj1_id, obj2_id)
                        detected_relations.add(relation_tuple)
                        print(f"✅ Binary relation: {relation_name}({obj1_id}, {obj2_id}) - confidence: {confidence:.3f}")
    
    print(f"🗺️ Final object mapping: {object_mapping}")
    print(f"🎯 Total detected relations: {len(detected_relations)}")
    
    # Step 3: Check each grounded predicate against detected relations
    relation_preds = []
    matched_count = 0
    
    for predicate in all_grounded_predicates:
        name = predicate['name']
        args = predicate['args']
        
        is_detected = False
        
        if len(args) == 1:
            # Unary relation: find the object ID for this domain object
            expected_obj = args[0]
            detected_id = None
            for obj_id, domain_name in object_mapping.items():
                if domain_name == expected_obj:
                    detected_id = obj_id
                    break
            
            if detected_id and (name, detected_id) in detected_relations:
                is_detected = True
                matched_count += 1
                print(f"✅ MATCH: {name}({expected_obj}) -> {name}({detected_id})")
                
        elif len(args) == 2:
            # Binary relation: find object IDs for both domain objects
            expected_obj1, expected_obj2 = args
            detected_id1 = None
            detected_id2 = None
            
            for obj_id, domain_name in object_mapping.items():
                if domain_name == expected_obj1:
                    detected_id1 = obj_id
                if domain_name == expected_obj2:
                    detected_id2 = obj_id
            
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

def detect_objects_with_dino(image_path: str, search_terms: list, box_threshold: float = 0.35):
    """
    DINO detection using VLM-identified search terms.
    
    Args:
        image_path: Path to the image
        search_terms: List of object names to search for (from VLM identification)
        box_threshold: Detection confidence threshold
        
    Returns:
        Dictionary of detected objects with bounding boxes
    """
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

    def get_text_query_fair(search_terms: list):
        """Create text query from VLM-identified search terms (no hardcoding)"""
        if not search_terms:
            return "", None, []
            
        text_phrases = search_terms
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
        """Execute Grounding DINO inference using proven working method"""
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

    def create_bbox_annotations_fair(boxes, detected_objects, phrases):
        """Create bbox annotations for fair detection"""
        bbox_annotations = {}
        
        for i, (box, obj, phrase) in enumerate(zip(boxes, detected_objects, phrases)):
            obj_key = f"{obj}_{i}"
            bbox_annotations[obj_key] = {
                "phrase": phrase,
                "bbox": box.tolist()
            }
            
        return bbox_annotations

    try:
        # 1. Load model
        model_path = "/local-ssd/custom_models/GroundingDINO/weights/groundingdino_swint_ogc.pth"
        config_path = "/local-ssd/custom_models/GroundingDINO/groundingdino/config/GroundingDINO_SwinT_OGC.py"
        model = gdino_inference.load_model(config_path, model_path).to("cuda")

        # 2. Load and preprocess image
        image_source, image = gdino_inference.load_image(image_path)
        src_h, src_w = image_source.shape[:2]

        # 3. Get text query from VLM-identified search terms
        text_query, phrase2object, token_spans = get_text_query_fair(search_terms)
        
        if not text_query:
            return {}

        # 4. Run DINO inference  
        boxes, phrases = get_grounding_output(
            image, text_query, token_spans, model, box_threshold
        )
        
        if len(boxes) == 0:
            return {}
        
        # 5. Process detection results
        detected_objects = []
        for phrase in phrases:
            phrase_clean = phrase.replace(" ", "_")
            detected_objects.append(phrase_clean)

        # 6. Convert coordinate format
        boxes = boxes * torch.Tensor([src_w, src_h, src_w, src_h])
        boxes = box_convert(boxes=boxes, in_fmt="cxcywh", out_fmt="xyxy")
        
        # 7. Create final annotation results
        bbox_anns = create_bbox_annotations_fair(boxes, detected_objects, phrases)
        
        return bbox_anns
        
    except Exception as e:
        print(f"Grounding DINO detection failed: {e}")
        return {}