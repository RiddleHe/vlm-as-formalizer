#!/usr/bin/env python

import os
import json
import random
import base64
import re
from tqdm import tqdm
import time
import traceback
from datetime import datetime
import subprocess
import glob
import tempfile
import shutil

from utils.experiment_logger import ExperimentLogger, create_experiment_log_path

from PIL import Image
import torch
import argparse

from utils.helpers import (
    seed_everything, 
    format_command,
    create_file_paths,
    load_problem_data,
    get_problem_pddl_path,
    get_annotated_bbox_path,
)
from utils.checkers import find_plan, compare_plans
from utils.generate import generate_pddl
from utils.models import VLMClientFactory

from dotenv import load_dotenv
load_dotenv('.env')

torch.set_float32_matmul_precision('high')


def parse_args():
    parser = argparse.ArgumentParser()

    # Data dirs
    parser.add_argument("--result_dir", type=str, default=None, help="direcotry for predicted bboxes, generated problems, and found plans")
    parser.add_argument("--domain", type=str, default=None, help="domain name (cooking/blocksworld/hanoi)")

    # Model args
    parser.add_argument("--model", type=str, default=None, help="model name")
    parser.add_argument("--device", type=str, default="cuda:0", help="device")
    parser.add_argument("--find_plan", action="store_true", default=True, help="refine generated problems by corrective reprompting")

    # Planning baseline
    parser.add_argument("--generate_plan", action="store_true", help="generate end-to-end plans")
    parser.add_argument("--generate_vila_planning", action="store_true", help="Pipeline 1: ViLA - VLM zero-shot planning")
    parser.add_argument("--generate_villain_pddl", action="store_true", help="Pipeline 2: ViLain - VLM → DINO → VLM PDDL Generation")
    parser.add_argument("--generate_villain_direct_pddl", action="store_true", help="Pipeline 3: ViLain Direct PDDL Generation (no object detection)")
    parser.add_argument("--generate_villain_captioning_pddl", action="store_true", help="Pipeline 4a: ViLain Captioning → PDDL (without DINO)")
    parser.add_argument("--generate_scene_graph_pddl", action="store_true", help="Pipeline 5a: Scene Graph → PDDL (without DINO)")
    parser.add_argument("--generate_multi_step_with_vlm", action="store_true", help="generate scene graph first with VLM")

    # Template constraint options
    parser.add_argument("--hard_template", action="store_true", default=True, help="Use hard domain template (strict predicate enforcement)")
    parser.add_argument("--soft_template", dest="hard_template", action="store_false", help="Use soft domain template (flexible predicate usage)")

    # If choose generate_end_to_end
    parser.add_argument("--generate_caption", action="store_true", help="generate caption for observation")
    parser.add_argument("--generate_scene_graph", action="store_true", help="generate scene graph for observation")
    parser.add_argument("--enable_caption", action="store_true", default=False, help="Enable captioning for the observation")

    # If choose generate_multi_step with VLM SCENE GRAPH
    parser.add_argument("--batch_relations", action="store_true", default=True, help="Generate all relations at once (default: True). Set --no-batch_relations for one-by-one")
    parser.add_argument("--no-batch_relations", dest="batch_relations", action="store_false", help="Generate relations one by one instead of all at once")

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

# Main

def main():
    args = parse_args()

    # Parse domain
    if args.domain == "cooking": # TODO: clean upon submission
        data_dir = f"/local-ssd/alfred/cooking" 
    elif args.domain == "blocksworld":
        data_dir = f"/local-ssd/alfred/blocksworld"
    elif args.domain == "blocksworld-real":
        data_dir = "/local-ssd/alfred/blocksworld-real"
    elif args.domain == "alfred":
        data_dir = "/local-ssd/alfred/alfred_137"
    else:
        raise ValueError(f"Invalid domain: {args.domain}")

    # build the result directory suffix, remove the pipeline number, use descriptive name
    result_dir_suffix = ""
    if args.result_dir is not None:
        result_dir_suffix += f"_{args.result_dir}"
    if args.model is not None:
        result_dir_suffix += f"_{args.model.replace('/', '-')}"
    
    result_dir = f"/local-ssd/villain/results/{args.domain}"
    if args.generate_plan:
        result_dir_suffix += "_generate_plan"
    if args.generate_vila_planning:
        result_dir_suffix += "_generate_vila_planning"
    if args.generate_villain_pddl:
        result_dir_suffix += "_generate_villain_pddl"
    if args.generate_villain_direct_pddl:
        result_dir_suffix += "_generate_villain_direct_pddl"
    if args.generate_villain_captioning_pddl:
        result_dir_suffix += "_generate_villain_captioning_pddl"
    if args.generate_villain_captioning_dino_pddl:
        result_dir_suffix += "_generate_villain_captioning_dino_pddl"
    if args.generate_scene_graph_pddl:
        template_type = "hard" if args.hard_template else "soft"
        result_dir_suffix += f"_generate_scene_graph_{template_type}_pddl"
    if args.generate_scene_graph_dino_pddl:
        template_type = "hard" if args.hard_template else "soft"
        result_dir_suffix += f"_generate_scene_graph_dino_{template_type}_pddl"
    
    # set the final path
    result_dir = result_dir + result_dir_suffix

    seed_everything(args.seed) 

    # Get task names from the reorganized structure (problem directories)
    task_names = sorted([
        dirname for dirname in os.listdir(data_dir)
        if os.path.isdir(f"{data_dir}/{dirname}")
        # and dirname.startswith("problem")
    ])

    logger = None
    solver_success_count = 0
    plan_success_count = 0

    # Generate / refine PDDL problems
    if (args.generate_end_to_end or args.generate_multi_step or args.generate_plan or 
        args.generate_multi_step_with_vlm or 
        args.generate_multi_step_with_sgclip_vlm or args.generate_vila_planning or
        args.generate_villain_pddl or args.generate_villain_direct_pddl or 
        args.generate_villain_captioning_pddl or args.generate_villain_captioning_dino_pddl or
        args.generate_scene_graph_pddl or args.generate_scene_graph_dino_pddl or
        args.generate_villain_gpt41_pddl or args.generate_villain_captioning_gpt41_pddl or args.generate_scene_graph_gpt41_pddl):
        
        log_file_path = create_experiment_log_path(result_dir, args.domain, result_dir_suffix.lstrip('_'))
        logger = ExperimentLogger(log_file_path, console_output=True)
        logger.__enter__()
        
        print(f"🧪 Starting experiment: {args.domain}{result_dir_suffix}")
        print(f"📁 Results will be saved to: {result_dir}")
        print(f"📋 Log will be saved to: {log_file_path}")
        print(f"{'='*80}")

         # Load model
        model = VLMClientFactory(args.model, args.device)

        # Load config (TODO: remove this)
        if os.path.exists(f"{data_dir}/config.json"):
            with open(f"{data_dir}/config.json", "r") as f:
                config = json.load(f)
        else:
            config = None

    # Set up problem tasks: instructions, observations...
    targets = []
    for i, task_name in tqdm(enumerate(task_names), total=len(task_names), desc="Loading problem data"):
        # task_idx = task_name.split("problem")[1] # problem might not have a number, eg. Alfred
        
        # Load problem data using new helper function
        problem_data = load_problem_data(data_dir, task_name, args.enable_caption, args.clean_image)

        targets += [{
            "problem": None,    
            "response": None,
            "observations": problem_data["observations"],
            "instruction": problem_data["instruction"],
            "domain": problem_data["domain_file"],
            "domain_path": problem_data["domain_path"],
            "plan": problem_data["plan"],
            "error": None,
        }]

    # Start generating
    for i, (task_name, target) in tqdm(
        enumerate(zip(task_names, targets)), 
        total=len(task_names), 
        desc="Generating PDDL problems"
    ):

        task_dir = f"{result_dir}/{task_name}"
        os.makedirs(task_dir, exist_ok=True)

        if (args.generate_end_to_end or args.generate_multi_step or args.generate_plan or 
            args.generate_multi_step_with_vlm or args.generate_multi_step_with_cv or 
            args.generate_multi_step_with_sgclip_vlm or args.generate_vila_planning or
            args.generate_villain_pddl or args.generate_villain_direct_pddl or 
            args.generate_villain_captioning_pddl or args.generate_villain_captioning_dino_pddl or
            args.generate_scene_graph_pddl or args.generate_scene_graph_dino_pddl or
            args.generate_villain_gpt41_pddl or args.generate_villain_captioning_gpt41_pddl or args.generate_scene_graph_gpt41_pddl): # generate pddl
            if "problem.pddl" in os.listdir(task_dir) or "problem-try-0.pddl" in os.listdir(task_dir):
                print(f"👀 {task_name} already exists, skipping...")
                continue

            print(f"Observations: {target['observations']}\n")
            print(f"Instruction: {target['instruction'][:100]}\n")

            # generate PDDL objects, initial state, and goal specification
            if args.generate_plan or args.generate_vila_planning:

                res, success = generate_pddl(
                    target,
                    config,
                    model=model,
                    args=args,
                )

            else:
                res, success = generate_pddl(
                    target,
                    config,
                    model=model,
                    args=args,
                    result_dir=result_dir,
                    save_step=args.gen_step,
                    task_name=task_name,
                )
                
            if success:
                solver_success_count += 1

            try:
                if (args.generate_end_to_end or args.generate_multi_step or 
                    args.generate_multi_step_with_vlm or args.generate_multi_step_with_cv or 
                    args.generate_multi_step_with_sgclip_vlm or args.generate_villain_pddl or
                    args.generate_villain_gpt41_pddl or args.generate_villain_direct_pddl or 
                    args.generate_villain_captioning_pddl or args.generate_villain_captioning_dino_pddl or
                    args.generate_villain_captioning_gpt41_pddl or args.generate_scene_graph_pddl or
                    args.generate_scene_graph_dino_pddl or args.generate_scene_graph_gpt41_pddl):
                    
                    for retry_idx in range(len(res["problem"]["file"])):
                        file_idx = f"-try-{retry_idx}"
                        if success and retry_idx == len(res["problem"]["file"]) - 1:
                            file_idx = ""
                        
                        with open(f"{task_dir}/problem{file_idx}.pddl", "w") as fw:
                            fw.write(res["problem"]["file"][retry_idx])

                        with open(f"{task_dir}/prompt{file_idx}.txt", "w") as fw:
                            fw.write(res["problem"]["prompt"][retry_idx])

                        with open(f"{task_dir}/response{file_idx}.txt", "w") as fw:
                            fw.write(res["problem"]["response"][retry_idx])
                
                elif args.generate_plan or args.generate_vila_planning:
                    with open(f"{task_dir}/plan.txt", "w") as fw:
                        fw.write(res["plan"])

                    with open(f"{task_dir}/prompt.txt", "w") as fw:
                        fw.write(res["instructions"])

                    with open(f"{task_dir}/response.txt", "w") as fw:
                        fw.write(res["responses"])
        
            except Exception as e:
                print(f"Error saving PDDL: {traceback.format_exc()}")

        if args.find_plan:
            problem_path = f"{task_dir}/problem.pddl"
            plan_path = f"{task_dir}/plan.txt" 
            if os.path.exists(problem_path):
                command = format_command(
                    target["domain_path"],  # pass in domain path, not file
                    problem_path,
                    plan_path,
                    args.downward_dir,
                    args.time_limit,
                )
                success, err = find_plan(command, plan_path)

                with open(f"{task_dir}/plan_gt.txt", "w") as fw:
                    fw.write(target["plan"])

                if success:
                    with open(f"{task_dir}/plan.txt", "r") as fw:
                        pred_plan = fw.readlines()
                    gt_plan = target["plan"].split("\n")
                    plan_success, err = compare_plans(gt_plan, pred_plan)
                    if plan_success:
                        plan_success_count += 1
                    if not plan_success:
                        print(f"Failed to find plan for {task_name}")
                        with open(f"{task_dir}/error.txt", "w") as fw:
                            fw.write(err)

                else:
                    print(f"Failed to find plan for {task_name}")
                    with open(f"{task_dir}/error.txt", "w") as fw:
                        fw.write(err)
            else:
                print(f"Problem file not found for {task_name}")

    print(f"\n{'='*80}")
    print(f"📊 FINAL EXPERIMENT METRICS")
    print(f"{'='*80}")
    print(f"🔧 Solver Success Count: {solver_success_count}")
    print(f"📋 Plan Success Count: {plan_success_count}")
    print(f"📈 Plan Success Rate: {plan_success_count / len(task_names):.2%}")
    print(f"📈 Solver Success Rate: {solver_success_count / len(task_names):.2%}")
    print(f"{'='*80}")

if __name__ == "__main__":
    main()