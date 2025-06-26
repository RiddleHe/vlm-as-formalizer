"""
<base_dir>/
|-- GroundingDINO/
|   |-- groundingdino/
|   |   |-- config/
|   |   |   |-- GroundingDINO_SwinT_OGC.py
|   |-- weights/
|   |   |-- groundingdino_swint_ogc.pth
|   |-- (and other files from the GroundingDINO repo)
|
|-- sam2/
|   |-- checkpoints/
|   |   |-- sam2.1_hiera_base_plus.pt
|   |-- sam2/
|   |   |-- configs/
|   |   |   |-- sam2.1/
|   |   |   |   |-- sam2.1_hiera_b+.yaml
|   |-- (and other files from the "patched" SAM2 repo)
|
|-- LASER/
|   |-- src/
|   |   |-- models/
|   |   |   |-- ensemble-2025-02-10-14-57-22.0.checkpoint
|   |   |-- visualization/
|   |   |   |-- mask_generation_grounding_dino.py
|   |   |   |-- utils.py
|   |   |   |-- vis_utils.py
|
"""

import torch
import numpy as np
import tempfile
from collections import defaultdict
import os
import sys
import imageio
from typing import List

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
    generate_masks_grounding_dino,
    device = "cuda:0",
):
    video_tensor = torch.from_numpy(np.stack(images)).to(device)

    with tempfile.NamedTemporaryFile(suffix=".mp4", delete=False) as tmp_video_file:
        new_video_path = tmp_video_file.name

    try:
        vidwrite(new_video_path, images, framerate=1, vcodec="libx264")
        
        with tempfile.TemporaryDirectory() as tmp_out_dir:
            video_segments, oid_class_pred, _ = generate_masks_grounding_dino(
                grounding_model=grounding_model,
                box_threshold=0.20,
                text_threshold=0.15,
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
    if not oids_to_remove:
        return batch

    new_batch = {}
    
    indices_to_keep = [
        i for i, (_, _, oid) in enumerate(batch["batched_object_ids"]) if oid not in oids_to_remove
    ]
    
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

    return new_batch

def get_object_classes(
    batch,
    images,
    object_classes,
    predicate_model,
    threshold: float,
):
    binary_object_classes = object_classes + [f"not {obj}" for obj in object_classes]
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

                if probs_pair[0] > probs_pair[1] + 0.10:
                    candidate_logits[pos_class] = logit_pos

        if candidate_logits:
            candidate_names = list(candidate_logits.keys())
            logits_tensor = torch.stack(list(candidate_logits.values()))
            final_probs = torch.nn.functional.softmax(logits_tensor, dim=0)
            top_prob, top_idx = torch.max(final_probs, dim=0)

            if top_prob >= threshold:
                oid_to_class[oid] = candidate_names[top_idx]
                oids_to_remove.remove(oid)

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
        batched_bboxes=batched_pred_bboxes,
        batched_names=[["object"]],
        batched_object_ids=batch["batched_object_ids"],
        batched_unary_kws=[[]],
        batched_binary_kws=[binary_relations],
        batched_obj_pairs=[batch["batched_object_pairs"]],
        batched_video_splits=[0],
        batched_binary_predicates=[None],
    )
    
    formatted_probs = format_binary_probs(
        batched_image_binary_probs,
        video_ids=["tmp_video"],
        oid_to_class=batch["object_ids_to_classes"],
        topk=len(binary_relations)
    )
    return formatted_probs.get("tmp_video", {})

# Pipeline

def setup_and_load_models(
        base_dir, 
        device="cuda", 
        dino_path="GroundingDINO", 
        sam_path="sam2", 
        inference_path="LASER/src/visualization",
        pred_model_path="LASER/src/models",
        pred_model_name="ensemble-2025-02-10-14-57-22.0.checkpoint",
    ):
    sys.path.append(os.path.join(base_dir, dino_path))
    sys.path.append(os.path.join(base_dir, sam_path))
    sys.path.append(os.path.join(base_dir, inference_path))
    sys.path.append(os.path.join(base_dir, pred_model_path))

    from groundingdino.util.inference import Model as gd_Model
    from sam2.build_sam import build_sam2, build_sam2_video_predictor
    from sam2.automatic_mask_generator import SAM2AutomaticMaskGenerator
    from llava_clip_model_v3 import PredicateModel as PredicateModel_v3

    # DINO
    gd_config = os.path.join(base_dir, dino_path, "groundingdino/config/GroundingDINO_SwinT_OGC.py")
    gd_checkpoint = os.path.join(base_dir, dino_path, "weights/groundingdino_swint_ogc.pth")
    grounding_model = gd_Model(model_config_path=gd_config, model_checkpoint_path=gd_checkpoint, device=device)
    print("GroundingDINO model loaded successfully.")

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
    unary_relations: List[str],
    binary_relations: List[str],
    models: dict,
):
    from mask_generation_grounding_dino import generate_masks_grounding_dino

    classes_ls = get_classes_ls(object_classes)
    batch = get_batched_objects(
        images=images,
        classes_ls=classes_ls,
        grounding_model=models["grounding_model"],
        sam_video_predictor=models["sam_video_predictor"],
        mask_generator=models["mask_generator"],
        generate_masks_grounding_dino=generate_masks_grounding_dino,
        device=models["device"]
    )

    if not batch:
        print("No objects were detected, cannot predict relations.")
        return {"unary": {}, "binary": {}}

    print(f"Batch successfully generated with {len(batch.get('batched_object_ids', []))} object instances.")
    
    refined_oid_to_class, oids_to_remove = get_object_classes(
        batch=batch,
        images=images,
        object_classes=object_classes,
        predicate_model=models["predicate_model"],
        threshold=0.60,
    )
    
    if oids_to_remove:
        batch = filter_batch_by_oids(batch, oids_to_remove)

    if refined_oid_to_class:
        batch["object_ids_to_classes"] = refined_oid_to_class
    else:
        batch["object_ids_to_classes"] = {
            oid: cls for oid, cls in batch.get("object_ids_to_classes", {}).items() 
            if oid not in oids_to_remove
        }

    visualize_predictions(
        images,
        batch["video_segments"],
        batch["object_ids_to_classes"],
        ".",
        show_masks=False
    )

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

    models = setup_and_load_models(BASE_DIR, DEVICE)

    image_paths = [os.path.join(BASE_DIR, "data/cooking/observations", f"problem4.jpg")]
    # image_paths = [os.path.join(BASE_DIR, "data/blocksworld-real/observations", f"problem22-1.jpg")]
    images = [imageio.imread(p) for p in image_paths]

    object_classes = ["cutting_board", "counter", "knife", "bowl"]
    # object_classes = ["red", "green", "blue", "yellow", "orange", "purple"]  # removing "cube" improves results
    unary_relations = ["is_empty"]
    binary_relations = ["on"]

    results = predict_all_relations(
        images=images,
        object_classes=object_classes,
        unary_relations=unary_relations,
        binary_relations=binary_relations,
        models=models,
    )