#!/usr/bin/env python

import os
import random
import argparse

import numpy as np
import torch
import matplotlib.pyplot as plt

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

    # Main generation stages
    parser.add_argument("--generate_scene_graph_first", action="store_true", help="generate scene graph first")
    parser.add_argument("--generate_end_to_end", action="store_true", help="generate PDDL end-to-end")
    parser.add_argument("--find_plan", action="store_true", default=True, help="refine generated problems by corrective reprompting")

    # End-goal generation choices
    parser.add_argument("--generate_plan", action="store_true", help="generate end-to-end plans")

    # Intermediate generation choices
    parser.add_argument("--generate_caption", action="store_true", help="generate caption for observation")
    parser.add_argument("--generate_scene_graph", action="store_true", help="generate scene graph for observation")

    # Data config
    parser.add_argument("--enable_caption", action="store_true", default=False, help="Enable captioning for the observation")
    parser.add_argument("--clean_image", action="store_true", default=False, help="Present a clean image to the model")

    # Runtime config
    parser.add_argument("--num_tries", type=int, default=2, help="the number of tries for each generation stage")

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