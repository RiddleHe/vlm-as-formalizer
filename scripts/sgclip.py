from utils import mask_to_bbox
dummy_unary_classes = ["object"]
batched_video_ids = ["0a7c1b9a-6c98-4f74-a8ad-3f06689d0146"]
binary_classes = ["beside", "holding", "reaching for", "cooking", "eating", "jumping over",  "kissing",]
batched_pred_bboxes = [mask_to_bbox(mask) for mask in batched_pred_masks]
batched_image_cate_probs, batched_image_unary_probs, batched_image_binary_probs, dummy_prob = \
    predicate_model(
        batched_video_ids=batched_video_ids,
        batched_videos=batched_reshaped_raw_videos,
        batched_masks=batched_pred_masks,  # batched_object_ids * video_height * video_width
        batched_bboxes=batched_pred_bboxes,  # batched_object_ids * dict<bboxes>
        batched_names=[dummy_unary_classes],  # Dataset-wise categorical labels
        batched_object_ids=batched_object_ids,  # [video_id, frame_id, object_id]
        batched_unary_kws=[[]],  # Dataset-wise unary predicate labels
        batched_binary_kws=[binary_classes],  # Dataset-wise binary predicate labels
        batched_obj_pairs=batched_interested_object_pairs,  # Ground truth binary relations
        batched_video_splits=[0],  # [number of videos]
        batched_binary_predicates=[None],  # None indicates inference time
    )