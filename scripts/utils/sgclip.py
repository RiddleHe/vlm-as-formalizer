import torch
import numpy as np
import tempfile
from collections import defaultdict
import os
import sys
import imageio
from typing import List, Literal


try:
    from .helpers import visualize_predictions
except ImportError:
    from helpers import visualize_predictions

# Utils

def get_classes_ls(
    object_classes: list[str],
    chunk_size = 5,
):
    return [
        object_classes[i: i+chunk_size] 
        for i in range(0, len(object_classes), chunk_size)
    ]

def vidwrite(path: str, frames: list, framerate: int, vcodec: str = 'libx264'):
    writer = imageio.get_writer(path, fps=framerate, codec=vcodec)
    for frame in frames:
        writer.append_data(frame)
    writer.close()

def mask_to_bbox(mask: np.ndarray) -> tuple | None:
    """Computes a bounding box from a binary mask."""
    y_indices, x_indices, _ = np.where(mask > 0)
    if y_indices.size > 0 and x_indices.size > 0:
        x_min, x_max = x_indices.min(), x_indices.max()
        y_min, y_max = y_indices.min(), y_indices.max()
        return (x_min, y_min, x_max, y_max)
    return None

def reformat_video_segments(
        vid: int, 
        segments: dict, 
        bbox_min_dim: int = 5
    ) -> tuple:
    """
    Reformats mask segments from the generator into a format suitable for the predicate model.
    """
    batched_object_ids = []
    batched_pred_masks = []
    batched_pred_bboxes = []
    frame_object_pairs = []
    
    for fid, frame_info in segments.items():
        valid_objs = []
        for oid, o_mask in frame_info.items():
            if torch.is_tensor(o_mask):
                o_mask = o_mask.permute(1, 2, 0).cpu().numpy()
            
            bbox = mask_to_bbox(o_mask)
            if bbox is not None:
                x_min, y_min, x_max, y_max = bbox
                if abs(y_max - y_min) < bbox_min_dim or abs(x_max - x_min) < bbox_min_dim:
                    continue
                valid_objs.append(oid)
                batched_object_ids.append((vid, fid, oid))
                batched_pred_masks.append(o_mask)
                batched_pred_bboxes.append(bbox)
                
        for i in valid_objs:
            for j in valid_objs:
                if i != j:
                    frame_object_pairs.append((vid, fid, (i, j)))

    batched_pred_bboxes = [mask_to_bbox(mask) for mask in batched_pred_masks]
            
    return batched_object_ids, batched_pred_masks, batched_pred_bboxes, frame_object_pairs

def format_unary_probs(
        batched_unary_probs: dict,
        video_ids: list[str],
        oid_to_class: dict,
        topk: int = 3
    ) -> dict:
    new_batched_unary_probs = {}
    for idx, vid_pred in batched_unary_probs.items():
        video_id = video_ids[idx]
        new_batched_unary_probs[video_id] = defaultdict(lambda: defaultdict(list))
        
        grouped_preds = defaultdict(lambda: defaultdict(list))
        for (fid, oid, predicate), prob in vid_pred.items():
            grouped_preds[fid][oid].append((prob, predicate))

        for fid, frame_preds in grouped_preds.items():
            for oid, preds in frame_preds.items():
                top_preds = sorted(preds, key=lambda x: x[0], reverse=True)[:topk]
                class_name = oid_to_class.get(oid, f"obj_{oid}")
                obj_key = f"{oid} ({class_name})"
                new_batched_unary_probs[video_id][fid][obj_key].extend(top_preds)
            
    return new_batched_unary_probs

def format_binary_probs(
        batched_binary_probs: list,
        video_ids: list[str],
        oid_to_class: dict,
        topk: int = 3
    ) -> dict:
    new_batched_binary_probs = {}
    for idx, vid_pred in enumerate(batched_binary_probs):
        video_id = video_ids[idx]
        new_batched_binary_probs[video_id] = defaultdict(dict)

        grouped_preds = defaultdict(lambda: defaultdict(list))
        for (fid, obj_tp, rel), prob in vid_pred.items():
            grouped_preds[fid][obj_tp].append((prob, rel))

        for fid in grouped_preds:
            for obj_tp, preds in grouped_preds[fid].items():
                top_preds = sorted(preds, key=lambda x: x[0], reverse=True)[:topk]

                oid1, oid2 = obj_tp
                name1 = oid_to_class.get(oid1, f"obj_{oid1}")
                name2 = oid_to_class.get(oid2, f"obj_{oid2}")
                obj_key = (f"{oid1} ({name1})", f"{oid2} ({name2})")
                
                new_batched_binary_probs[video_id][fid][obj_key] = top_preds

    return new_batched_binary_probs

# Model calls

def get_batched_objects(
    images: list[np.ndarray],
    classes_ls: list[list[str]],
    grounding_model,
    sam_video_predictor,
    mask_generator,
    generate_masks,
    detector_type: Literal["dino", "yoloe", "both"] = "both",
    device = "cuda:0",
):
    video_tensor = torch.from_numpy(np.stack(images)).to(device)

    with tempfile.NamedTemporaryFile(suffix=".mp4", delete=False) as tmp_video_file:
        new_video_path = tmp_video_file.name

    try:
        vidwrite(new_video_path, images, framerate=1, vcodec="libx264")
        
        with tempfile.TemporaryDirectory() as tmp_out_dir:
            if detector_type in ["dino"]:
                video_segments, oid_class_pred, _ = generate_masks(
                    grounding_model=grounding_model,
                    box_threshold=0.35,
                    text_threshold=0.25,
                    predictor=sam_video_predictor,
                    mask_generator=mask_generator,
                    video_tensor=video_tensor,
                    video_path=new_video_path,
                    video_id="tmp_video",
                    out_dir=tmp_out_dir,
                    classes_ls=classes_ls,
                    target_fps=None,
                    visualize=False,
                )
            elif detector_type in ["yoloe"]:
                video_segments, oid_class_pred, success = generate_masks(
                    yoloe_model=grounding_model,
                    conf_threshold=0.05,  # Very low confidence threshold to detect more objects
                    predictor=sam_video_predictor,
                    mask_generator=mask_generator,
                    video_tensor=video_tensor,
                    video_path=new_video_path,
                    video_id="tmp_video",
                    out_dir=tmp_out_dir,
                    classes_ls=classes_ls,
                    target_fps=None,
                    visualize=False,
                    max_prop_time=3,
                    iou_thr=0.3,  # Lower IoU threshold to allow more overlapping detections
                    score_thr=0.2,  # Lower score threshold for more detections
                    inner_thr=0.1,  # Lower inner threshold
                    frames=None,
                    min_mask_size=10,  # Smaller minimum mask size
                    device="cuda:0"
                )
            # oid_class_pred = {
            #    1: "red cube",
            #    2: "red cube",
            #    3: "green cube",
            # }
    finally:
        if os.path.exists(new_video_path):
            os.remove(new_video_path)

    batched_object_ids, batched_pred_masks, batched_pred_bboxes, batched_object_pairs = \
        reformat_video_segments(0, video_segments)
    # batched_object_ids = [(video_id, frame_id, object_id), ...]
    # batched_pred_masks = [mask, ...]  # (batch_size, height, width)
    # batched_pred_bboxes = [bbox, ...]  # (batch_size, 4)
    # batched_object_pairs = [(video_id, frame_id, (object_id1, object_id2)), ...]

    if not batched_object_ids:
        print("No object ids found")
        return {}
    
    return {
        "batched_object_ids": batched_object_ids,
        "batched_pred_masks": batched_pred_masks,
        "batched_pred_bboxes": batched_pred_bboxes,
        "batched_object_pairs": batched_object_pairs,
        "object_ids_to_classes": oid_class_pred,
        "video_segments": video_segments,
    }

def filter_batch_by_oids(batch: dict, oids_to_remove: set) -> dict:
    print(f"DEBUG: filter_batch_by_oids input oids_to_remove: {oids_to_remove}")
    print(f"DEBUG: filter_batch_by_oids input batch['batched_object_ids']: {batch['batched_object_ids']}")
    
    if not oids_to_remove:
        print(f"DEBUG: filter_batch_by_oids no oids to remove, returning original batch")
        return batch

    new_batch = {}
    
    indices_to_keep = [
        i for i, (_, _, oid) in enumerate(batch["batched_object_ids"]) if oid not in oids_to_remove
    ]
    
    print(f"DEBUG: filter_batch_by_oids indices_to_keep: {indices_to_keep}")
    
    new_batch["batched_object_ids"] = [batch["batched_object_ids"][i] for i in indices_to_keep]
    new_batch["batched_pred_masks"] = [batch["batched_pred_masks"][i] for i in indices_to_keep]
    new_batch["batched_pred_bboxes"] = [batch["batched_pred_bboxes"][i] for i in indices_to_keep]

    new_batch["batched_object_pairs"] = [
        pair for pair in batch["batched_object_pairs"]
        if pair[2][0] not in oids_to_remove and pair[2][1] not in oids_to_remove
    ]
    
    new_video_segments = {}
    for fid, frame_segments in batch["video_segments"].items():
        new_frame_segments = {
            oid: mask for oid, mask in frame_segments.items() if oid not in oids_to_remove
        }
        if new_frame_segments:
            new_video_segments[fid] = new_frame_segments
    new_batch["video_segments"] = new_video_segments
    
    new_batch["object_ids_to_classes"] = batch["object_ids_to_classes"]

    print(f"DEBUG: filter_batch_by_oids output batch['batched_object_ids']: {new_batch['batched_object_ids']}")
    
    return new_batch

def get_object_classes(
    batch,
    images,
    object_classes,
    predicate_model,
    threshold: float,
):
    print(f"DEBUG: get_object_classes input batch['batched_object_ids']: {batch['batched_object_ids']}")
    print(f"DEBUG: get_object_classes input object_classes: {object_classes}")
    
    binary_object_classes = object_classes + [f"not {obj}" for obj in object_classes]
    print(f"DEBUG: get_object_classes binary_object_classes: {binary_object_classes}")
    
    batched_image_cate_logits, _, _, _ = predicate_model(
        batched_video_ids=["tmp_video"],
        batched_videos=images,
        batched_masks=batch["batched_pred_masks"],
        batched_bboxes=batch["batched_pred_bboxes"],
        batched_names=[binary_object_classes],
        batched_object_ids=batch["batched_object_ids"],
        batched_unary_kws=[[]],
        batched_binary_kws=[[]],
        batched_obj_pairs=[],
        batched_video_splits=[0],
        batched_binary_predicates=[None],
        output_logit=True,  # output logits to customize probs
    )

    vid_logits = batched_image_cate_logits.get(0, {})
    if not vid_logits:
        return {}, set()

    grouped_by_oid = defaultdict(dict)
    for (oid, cate), logit in vid_logits.items():
        grouped_by_oid[oid][cate] = logit

    oid_to_class = {}
    oids_to_remove = set(grouped_by_oid.keys())
    for oid, class_logits in grouped_by_oid.items():
        candidate_logits = {}
        for pos_class in object_classes:
            neg_class = f"not {pos_class}"
            if pos_class in class_logits and neg_class in class_logits:
                logit_pos = class_logits[pos_class]
                logit_neg = class_logits[neg_class]

                logits_pair = torch.stack([logit_pos, logit_neg])
                probs_pair = torch.nn.functional.softmax(logits_pair, dim=0)

                if probs_pair[0] > probs_pair[1] + 0.20:
                    candidate_logits[pos_class] = logit_pos

        if candidate_logits:
            candidate_names = list(candidate_logits.keys())
            logits_tensor = torch.stack(list(candidate_logits.values()))
            final_probs = torch.nn.functional.softmax(logits_tensor, dim=0)
            top_prob, top_idx = torch.max(final_probs, dim=0)

            if top_prob >= threshold:
                oid_to_class[oid] = candidate_names[top_idx]
                oids_to_remove.remove(oid)

    print(f"DEBUG: get_object_classes output oid_to_class: {oid_to_class}")
    print(f"DEBUG: get_object_classes output oids_to_remove: {oids_to_remove}")
    
    return oid_to_class, oids_to_remove

def get_unary_relations(
    batch,
    images,
    unary_relations,
    predicate_model,
):
    _, batched_image_unary_probs, _, _ = predicate_model(
        batched_video_ids=["tmp_video"],
        batched_videos=images,
        batched_masks=batch["batched_pred_masks"],
        batched_bboxes=batch["batched_pred_bboxes"],
        batched_names=[["object"]],
        batched_object_ids=batch["batched_object_ids"],
        batched_unary_kws=[unary_relations],
        batched_binary_kws=[[]],
        batched_obj_pairs=[],
        batched_video_splits=[0],
        batched_binary_predicates=[None],
    )

    video_ids = ["tmp_video"]
    formatted_probs = format_unary_probs(
        batched_image_unary_probs,
        video_ids=video_ids,
        oid_to_class=batch["object_ids_to_classes"],
        topk=len(unary_relations)
    )
    return formatted_probs.get(video_ids[0], {})


def compute_spatial_relations(batch, binary_relations):
    """
    Compute spatial relations based on bounding box positions.
    This is a fallback when sgclip gives unreliable predictions.
    """
    spatial_relations = {}
    
    if "on" in binary_relations:
        # Extract object positions from bounding boxes
        object_positions = {}
        for i, (vid, fid, oid) in enumerate(batch["batched_object_ids"]):
            bbox = batch["batched_pred_bboxes"][i]
            # bbox format: (x_min, y_min, x_max, y_max)
            center_x = (bbox[0] + bbox[2]) / 2
            center_y = (bbox[1] + bbox[3]) / 2
            bottom_y = bbox[3]  # Bottom edge of object
            top_y = bbox[1]     # Top edge of object
            width = bbox[2] - bbox[0]
            height = bbox[3] - bbox[1]
            
            if fid not in object_positions:
                object_positions[fid] = {}
            object_positions[fid][oid] = {
                'center': (center_x, center_y),
                'bottom': bottom_y,
                'top': top_y,
                'bbox': bbox,
                'width': width,
                'height': height
            }
        
        print("🔍 DEBUG: Object positions:")
        for fid, positions in object_positions.items():
            print(f"  Frame {fid}:")
            for oid, pos in positions.items():
                print(f"    Object {oid}: bbox={pos['bbox']}, center={pos['center']}, size=({pos['width']:.1f}x{pos['height']:.1f})")
        
        # Compute "on" relations with IMPROVED physics constraints
        for fid, positions in object_positions.items():
            if fid not in spatial_relations:
                spatial_relations[fid] = {}
                
            for oid1, pos1 in positions.items():
                for oid2, pos2 in positions.items():
                    if oid1 != oid2:
                        # FIXED "on" relation conditions:
                        # 1. oid1 must be above oid2 (oid1's bottom near oid2's top)
                        # 2. Reasonable horizontal overlap (not necessarily perfect alignment)
                        
                        # Check if oid1 is above oid2 - CORRECTED LOGIC
                        # For stacking: oid1's bottom should be near oid2's top
                        vertical_gap = pos1['bottom'] - pos2['top']  # Small positive means oid1 is directly above oid2
                        horizontal_overlap = min(pos1['bbox'][2], pos2['bbox'][2]) - max(pos1['bbox'][0], pos2['bbox'][0])
                        
                        # Calculate horizontal centers distance
                        horizontal_center_distance = abs(pos1['center'][0] - pos2['center'][0])
                        
                        # More lenient thresholds:
                        contact_threshold = 25  # pixels - allow some gap for imperfect detection
                        min_overlap = 10  # pixels - require some horizontal overlap
                        max_center_distance = 50  # pixels - allow reasonable center distance
                        
                        print(f"    Checking {oid1} on {oid2}:")
                        print(f"      Vertical gap (oid1_bottom - oid2_top): {vertical_gap:.1f}px (threshold: {contact_threshold}px)")
                        print(f"      Horizontal overlap: {horizontal_overlap:.1f}px (min: {min_overlap}px)")
                        print(f"      Horizontal center distance: {horizontal_center_distance:.1f}px (max: {max_center_distance}px)")
                        
                        # Check if this could be a valid "on" relation
                        # oid1 is on oid2 if oid1's bottom is close to oid2's top (small positive gap)
                        is_stacked_on = vertical_gap >= -contact_threshold and vertical_gap <= contact_threshold
                        has_overlap = horizontal_overlap >= min_overlap
                        reasonable_alignment = horizontal_center_distance <= max_center_distance
                        
                        if is_stacked_on and (has_overlap or reasonable_alignment):
                            # High confidence for valid "on" relation
                            confidence = 0.90
                            print(f"      ✅ DETECTED ON RELATION: {oid1} is on {oid2}")
                        else:
                            # Low confidence for invalid relation
                            confidence = 0.05
                            print(f"      ❌ NOT ON: is_stacked_on={is_stacked_on}, has_overlap={has_overlap}, reasonable_alignment={reasonable_alignment}")
                        
                        obj_key = (oid1, oid2)
                        if obj_key not in spatial_relations[fid]:
                            spatial_relations[fid][obj_key] = []
                        spatial_relations[fid][obj_key].append((confidence, "on"))
    
    return spatial_relations


def get_binary_relations(
    batch,
    images,
    binary_relations,
    predicate_model,
):

    _, _, batched_image_binary_probs, _ = predicate_model(
        batched_video_ids=["tmp_video"],
        batched_videos=images,
        batched_masks=batch["batched_pred_masks"],
        batched_bboxes=batch["batched_pred_bboxes"],
        batched_names=[["object"]],
        batched_object_ids=batch["batched_object_ids"],
        batched_unary_kws=[[]],
        batched_binary_kws=[binary_relations],
        batched_obj_pairs=batch["batched_object_pairs"],
        batched_video_splits=[0],
        batched_binary_predicates=[None],
    )
    
    formatted_probs = format_binary_probs(
        batched_image_binary_probs,
        video_ids=["tmp_video"],
        oid_to_class=batch["object_ids_to_classes"],
        topk=len(binary_relations)
    )
    
    # Check if sgclip is giving unreliable predictions (all 100%)
    all_100_percent = True
    for frame_data in formatted_probs.values():
        for predictions in frame_data.values():
            for conf, rel in predictions:
                if rel == "on" and float(conf) < 0.99:
                    all_100_percent = False
                    break
    
    if all_100_percent and "on" in binary_relations:
        print("⚠️  Warning: sgclip giving 100% confidence for all 'on' relations.")
        print("🔧 Using spatial reasoning as fallback...")
        
        # Compute spatial relations
        spatial_relations = compute_spatial_relations(batch, binary_relations)
        
        # Format spatial relations to match expected output
        formatted_spatial = {}
        for fid, frame_relations in spatial_relations.items():
            formatted_spatial[fid] = {}
            for (oid1, oid2), predictions in frame_relations.items():
                # Convert to tensor format
                tensor_predictions = [(torch.tensor(conf), rel) for conf, rel in predictions]
                
                # Get object class names
                class1 = batch["object_ids_to_classes"].get(oid1, f"obj_{oid1}")
                class2 = batch["object_ids_to_classes"].get(oid2, f"obj_{oid2}")
                obj_key = (f"{oid1} ({class1})", f"{oid2} ({class2})")
                
                formatted_spatial[fid][obj_key] = tensor_predictions
        
        print(f"🔧 DEBUG: Formatted spatial relations: {formatted_spatial}")
        return formatted_spatial
    
    return formatted_probs.get("tmp_video", {})

def calculate_iou(bbox1, bbox2):
    """Calculate Intersection over Union (IoU) of two bounding boxes."""
    x1_min, y1_min, x1_max, y1_max = bbox1
    x2_min, y2_min, x2_max, y2_max = bbox2
    
    # Calculate intersection
    intersection_x_min = max(x1_min, x2_min)
    intersection_y_min = max(y1_min, y2_min)
    intersection_x_max = min(x1_max, x2_max)
    intersection_y_max = min(y1_max, y2_max)
    
    if intersection_x_max <= intersection_x_min or intersection_y_max <= intersection_y_min:
        return 0.0
    
    intersection_area = (intersection_x_max - intersection_x_min) * (intersection_y_max - intersection_y_min)
    
    # Calculate union
    area1 = (x1_max - x1_min) * (y1_max - y1_min)
    area2 = (x2_max - x2_min) * (y2_max - y2_min)
    union_area = area1 + area2 - intersection_area
    
    return intersection_area / union_area if union_area > 0 else 0.0

def filter_overlapping_detections(batch, iou_threshold=0.5):
    """
    Filter out overlapping detections based on IoU threshold.
    Keep the detection with higher confidence/larger area.
    """
    if not batch or not batch.get("batched_object_ids"):
        return batch
    
    object_ids = batch["batched_object_ids"]
    bboxes = batch["batched_pred_bboxes"]
    masks = batch["batched_pred_masks"]
    
    print(f"🔍 Filtering overlapping detections (IoU threshold: {iou_threshold})...")
    print(f"  Input: {len(object_ids)} detections")
    
    # Calculate areas for each detection
    areas = []
    for bbox in bboxes:
        area = (bbox[2] - bbox[0]) * (bbox[3] - bbox[1])
        areas.append(area)
    
    # Find overlapping pairs and mark for removal
    to_remove = set()
    
    for i in range(len(object_ids)):
        if i in to_remove:
            continue
            
        for j in range(i + 1, len(object_ids)):
            if j in to_remove:
                continue
                
            iou = calculate_iou(bboxes[i], bboxes[j])
            
            if iou > iou_threshold:
                # Remove the one with smaller area (keep larger detection)
                if areas[i] >= areas[j]:
                    to_remove.add(j)
                    print(f"  Removing detection {j} (IoU: {iou:.3f} with {i}, smaller area: {areas[j]} < {areas[i]})")
                else:
                    to_remove.add(i)
                    print(f"  Removing detection {i} (IoU: {iou:.3f} with {j}, smaller area: {areas[i]} < {areas[j]})")
                    break  # Don't check further pairs for this detection
    
    # Create filtered batch
    filtered_indices = [i for i in range(len(object_ids)) if i not in to_remove]
    
    filtered_batch = {
        "batched_object_ids": [object_ids[i] for i in filtered_indices],
        "batched_pred_masks": [masks[i] for i in filtered_indices],
        "batched_pred_bboxes": [bboxes[i] for i in filtered_indices],
        "object_ids_to_classes": batch["object_ids_to_classes"],
        "video_segments": batch["video_segments"]
    }
    
    # Update object pairs (remove pairs involving removed objects)
    removed_oids = {object_ids[i][2] for i in to_remove}  # Extract object IDs
    filtered_pairs = []
    for pair in batch.get("batched_object_pairs", []):
        vid, fid, (oid1, oid2) = pair
        if oid1 not in removed_oids and oid2 not in removed_oids:
            filtered_pairs.append(pair)
    
    filtered_batch["batched_object_pairs"] = filtered_pairs
    
    print(f"  Output: {len(filtered_batch['batched_object_ids'])} detections (removed {len(to_remove)})")
    
    return filtered_batch

# Pipeline
def setup_and_load_models(
        base_dir, 
        device="cuda", 
        detector_type: Literal["dino", "yoloe", "both"] = "both",  # NEW PARAMETER
        dino_path="/local-ssd/custom_models/GroundingDINO/", 
        sam_path="/home/mh3897/pddl/villain/sam2", 
        inference_path="/home/mh3897/pddl/villain/LASER/src/visualization",
        pred_model_path="/local-ssd/custom_models/sgclip",
        pred_model_name="ensemble-2025-02-10-14-57-22.0.checkpoint",
        yoloe_path="/local-ssd/yoloe/pretrain",
        yoloe_model_name="yoloe-11l-seg.pt",
    ):
    # Import necessary modules first
    import sys
    from transformers.models.clip.modeling_clip import CLIPAttention
    from transformers.models.clip.configuration_clip import CLIPConfig  # THIS WAS MISSING!
    
    # Create a dummy CLIPSdpaAttention class
    class CLIPSdpaAttention(CLIPAttention):
        """Dummy class to handle missing CLIPSdpaAttention in older transformers versions"""
        is_causal = False  # Set as class attribute
        
        def __init__(self, config):
            super().__init__(config)
            self.is_causal = False  # Add missing attribute as instance attribute
            
        def __getattr__(self, name):
            # Fallback for any missing attributes
            if name == 'is_causal':
                return False
            return super().__getattr__(name)

    # Inject it into the transformers module
    setattr(sys.modules['transformers.models.clip.modeling_clip'], 'CLIPSdpaAttention', CLIPSdpaAttention)

    # Fix 2: Try to set the missing attributes directly on CLIPConfig
    try:
        if not hasattr(CLIPConfig, '_output_attentions'):
            CLIPConfig._output_attentions = False
        if not hasattr(CLIPConfig, '_output_hidden_states'):
            CLIPConfig._output_hidden_states = False
        if not hasattr(CLIPConfig, '_return_dict'):
            CLIPConfig._return_dict = True
    except:
        pass  # If this fails, continue without the patch

    # Import SAM2 and predicate model (always needed)
    from sam2.build_sam import build_sam2, build_sam2_video_predictor
    from sam2.automatic_mask_generator import SAM2AutomaticMaskGenerator
    
    # Add the predicate model path to sys.path
    sys.path.append(os.path.join(base_dir, pred_model_path))
    from llava_clip_model_v3 import PredicateModel as PredicateModel_v3

    # Load GroundingDINO if requested
    if detector_type in ["dino"]:
        sys.path.append(dino_path)
        from groundingdino.util.inference import Model as gd_Model
        
        gd_config = os.path.join(base_dir, dino_path, "groundingdino/config/GroundingDINO_SwinT_OGC.py")
        gd_checkpoint = os.path.join(base_dir, dino_path, "weights/groundingdino_swint_ogc.pth")
        grounding_model = gd_Model(model_config_path=gd_config, model_checkpoint_path=gd_checkpoint, device=device)
        print("GroundingDINO model loaded successfully.")
    
    # Load YOLOE if requested
    if detector_type in ["yoloe"]:
        from ultralytics import YOLOE
        yoloe_model_path = os.path.join(yoloe_path, yoloe_model_name)
        yoloe_model = YOLOE(yoloe_model_path)
        yoloe_model.to(device)
        grounding_model = yoloe_model
        print("YOLOE model loaded successfully.")

    # SAM2
    sam_checkpoint = os.path.join(base_dir, sam_path, "checkpoints/sam2.1_hiera_base_plus.pt")
    sam_config = "configs/sam2.1/sam2.1_hiera_b+.yaml"  # expect relative path
    sam2_model = build_sam2(sam_config, sam_checkpoint, device=device, apply_postprocessing=False)
    sam_video_predictor = build_sam2_video_predictor(sam_config, sam_checkpoint, device=device)
    mask_generator = SAM2AutomaticMaskGenerator(model=sam2_model, use_m2m=True)
    print("SAM2 model loaded successfully.")

    # Predicate Model
    pred_model_dir = os.path.join(base_dir, pred_model_path)
    model_path = os.path.join(pred_model_dir, pred_model_name)
    assert os.path.exists(model_path), f"Predicate model not found at: {model_path}"
    predicate_model = torch.load(model_path, map_location=device, weights_only=False)
    predicate_model.clip_tokenizer.pad_token_id = 0
    predicate_model.clip_tokenizer.pad_token = "<|endoftext|>"
    print("Predicate model loaded successfully.")

    print("All models loaded successfully.")
    
    return {
        "grounding_model": grounding_model,
        "sam_video_predictor": sam_video_predictor,
        "mask_generator": mask_generator,
        "predicate_model": predicate_model,
        "device": device
    }
    
def predict_all_relations(
    images: List[np.ndarray],
    object_classes: List[str],
    unary_relations: List[str] = None,
    binary_relations: List[str] = None,
    models: dict = None,
    detector_type: Literal["dino", "yoloe", "both"] = "both",
    detection_only: bool = False,
):
    # Use importlib to import directly from specific paths
    import importlib.util
    import importlib.machinery
    
    # Path to the mask generation module
    inference_path = "/home/mh3897/pddl/villain/LASER/src/visualization"
    mask_gen_path = os.path.join(inference_path, "mask_generation_grounding_dino.py")
    
    # Save original sys.path
    original_path = sys.path[:]
    
    try:
        # First, import the correct utils module from LASER
        laser_utils_path = os.path.join(inference_path, "utils.py")
        laser_utils_spec = importlib.util.spec_from_file_location("laser_utils", laser_utils_path)
        laser_utils = importlib.util.module_from_spec(laser_utils_spec)
        laser_utils_spec.loader.exec_module(laser_utils)
        
        # Monkey patch: temporarily replace utils in sys.modules
        current_dir = os.path.dirname(os.path.abspath(__file__))
        scripts_dir = os.path.dirname(current_dir)
        
        # Store original modules that might conflict
        original_utils = sys.modules.get('utils', None)
        original_scripts_utils = sys.modules.get('scripts.utils', None)
        
        # Temporarily replace utils with the LASER utils
        sys.modules['utils'] = laser_utils
        
        # Clean sys.path and add necessary paths
        minimal_path = [
            inference_path,
            "/local-ssd/custom_models/GroundingDINO/",
        ]
        # Add back essential system paths but not our local scripts
        for path in original_path:
            if path != scripts_dir and path != current_dir and path not in minimal_path:
                if ('site-packages' in path or 'conda' in path or 'python' in path or 
                    'lib' in path or not path or path.startswith('/usr')):
                    minimal_path.append(path)
        
        sys.path = minimal_path
        
        try:
            # Import the module directly
            spec = importlib.util.spec_from_file_location("mask_generation_grounding_dino", mask_gen_path)
            mask_gen_module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mask_gen_module)
            
            # Get the functions we need
            generate_masks_yoloe = mask_gen_module.generate_masks_yoloe
            try:
                generate_masks_grounding_dino = mask_gen_module.generate_masks_grounding_dino
            except AttributeError:
                print("Warning: generate_masks_grounding_dino not found, using YOLOE only")
                generate_masks_grounding_dino = None
                
        finally:
            # Restore original utils modules
            if original_utils is not None:
                sys.modules['utils'] = original_utils
            elif 'utils' in sys.modules:
                del sys.modules['utils']
                
            if original_scripts_utils is not None:
                sys.modules['scripts.utils'] = original_scripts_utils
            
    except Exception as e:
        print(f"Warning: Failed to import mask generation module: {e}")
        print(f"Returning empty results")
        return {"unary": {}, "binary": {}}
    finally:
        # Always restore original sys.path
        sys.path = original_path

    classes_ls = get_classes_ls(object_classes)
    if detector_type in ["dino"]:
        if generate_masks_grounding_dino is None:
            print("Error: GroundingDINO not available, switching to YOLOE")
            detector_type = "yoloe"
        else:
            try:
                batch = get_batched_objects(
                    images=images,
                    classes_ls=classes_ls,
                    grounding_model=models["grounding_model"],
                    sam_video_predictor=models["sam_video_predictor"],
                    mask_generator=models["mask_generator"],
                    generate_masks=generate_masks_grounding_dino,
                    detector_type=detector_type,
                    device=models["device"]
                )
            except AssertionError as e:
                print(f"Object detection failed (no objects detected): {e}")
                return {"unary": {}, "binary": {}}
            except Exception as e:
                print(f"Object detection failed with error: {e}")
                return {"unary": {}, "binary": {}}
    
    if detector_type in ["yoloe"]:
        try:
            batch = get_batched_objects(
                images=images,
                classes_ls=classes_ls,
                grounding_model=models["grounding_model"],
                sam_video_predictor=models["sam_video_predictor"],
                mask_generator=models["mask_generator"],
                generate_masks=generate_masks_yoloe,
                detector_type=detector_type,
                device=models["device"]
            )
        except AssertionError as e:
            print(f"Object detection failed (no objects detected): {e}")
            return {"unary": {}, "binary": {}}
        except Exception as e:
            print(f"Object detection failed with error: {e}")
            return {"unary": {}, "binary": {}}

    if not batch:
        print("No objects were detected, cannot predict relations.")
        return {"unary": {}, "binary": {}}

    print(f"Batch successfully generated with {len(batch.get('batched_object_ids', []))} object instances.")
    
    # Filter out overlapping detections
    batch = filter_overlapping_detections(batch, iou_threshold=0.7)
    
    if not batch or not batch.get('batched_object_ids'):
        print("No objects remaining after filtering overlapping detections.")
        return {"unary": {}, "binary": {}}
    
    # Skip object reclassification - use the original YOLOE classifications directly
    # No objects to remove - keep all detected objects
    # batch["object_ids_to_classes"] is already set from the detection stage

    visualize_predictions(
        images,
        batch["video_segments"],
        batch["object_ids_to_classes"],
        ".",
        show_masks=False
    )

    # If detection_only mode, return early with detection results
    if detection_only:
        return {
            "batch": batch,
            "object_detections": batch["object_ids_to_classes"],
            "annotated_images_saved": True,
            "unary": {},
            "binary": {}
        }

    unary_results = {}
    if unary_relations:
        unary_results = get_unary_relations(
            batch=batch,
            images=images,
            unary_relations=unary_relations,
            predicate_model=models["predicate_model"]
        )

    print(unary_results)

    binary_results = {}
    if binary_relations:
        binary_results = get_binary_relations(
            batch=batch,
            images=images,
            binary_relations=binary_relations,
            predicate_model=models["predicate_model"]
        )

    print(binary_results)

    return {"unary": unary_results, "binary": binary_results}

if __name__ == "__main__":
    BASE_DIR = os.path.join(os.path.dirname(__file__), "..", "..")
    DEVICE = "cuda"

    models = setup_and_load_models(BASE_DIR, DEVICE, detector_type="yoloe")

    # image_paths = [os.path.join(BASE_DIR, "data/cooking/observations", f"problem4.jpg")]
    image_paths = [os.path.join(BASE_DIR, "data/blocksworld/observations", f"problem4.jpg")]
    images = [imageio.imread(p) for p in image_paths]

    # object_classes = ["cutting_board", "counter", "knife", "bowl", "vegetable"]
    object_classes = ["block", "cube", "toy", "brick", "object"]  # Removed "box" to avoid duplicates
    unary_relations = ["is_empty"]
    binary_relations = ["on"]

    results = predict_all_relations(
        images=images,
        object_classes=object_classes,
        unary_relations=unary_relations,
        binary_relations=binary_relations,
        models=models,
        detector_type="yoloe",
    )
    print(results)