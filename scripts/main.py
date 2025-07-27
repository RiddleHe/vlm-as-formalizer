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

    # Main generation choices
    parser.add_argument("--generate_end_to_end", action="store_true", help="generate PDDL end-to-end")
    parser.add_argument("--generate_multi_step", action="store_true", help="generate scene graph first")
    parser.add_argument("--generate_multi_step_with_vlm", action="store_true", help="generate scene graph first with VLM")
    parser.add_argument("--generate_multi_step_with_cv", action="store_true", help="generate scene graph first with CV model")
    parser.add_argument("--generate_multi_step_with_sgclip_vlm", action="store_true", help="generate scene graph first with SGCLIP-VLM")

    # Planning baseline
    parser.add_argument("--generate_plan", action="store_true", help="generate end-to-end plans")
    parser.add_argument("--generate_vila_planning", action="store_true", help="Pipeline 1: ViLA - VLM zero-shot planning")
    parser.add_argument("--generate_villain_pddl", action="store_true", help="Pipeline 2: ViLain - VLM → DINO → VLM PDDL Generation")
    parser.add_argument("--generate_villain_gpt41_pddl", action="store_true", help="Pipeline 2-GPT: ViLain - VLM → GPT-4.1 → VLM PDDL Generation (Control)")
    parser.add_argument("--generate_villain_direct_pddl", action="store_true", help="Pipeline 3: ViLain Direct PDDL Generation (no object detection)")
    parser.add_argument("--generate_villain_captioning_pddl", action="store_true", help="Pipeline 4a: ViLain Captioning → PDDL (without DINO)")
    parser.add_argument("--generate_villain_captioning_dino_pddl", action="store_true", help="Pipeline 4b: ViLain Captioning → DINO → PDDL (Enhanced)")
    parser.add_argument("--generate_villain_captioning_gpt41_pddl", action="store_true", help="Pipeline 4b-GPT: ViLain Captioning → GPT-4.1 → PDDL (Control)")
    parser.add_argument("--generate_scene_graph_pddl", action="store_true", help="Pipeline 5a: Scene Graph → PDDL (without DINO)")
    parser.add_argument("--generate_scene_graph_dino_pddl", action="store_true", help="Pipeline 5b: Scene Graph → DINO → PDDL (with bbox)")
    parser.add_argument("--generate_scene_graph_gpt41_pddl", action="store_true", help="Pipeline 5b-GPT: Scene Graph → GPT-4.1 → PDDL (Control)")
    
    # Template constraint options
    parser.add_argument("--hard_template", action="store_true", default=True, help="Use hard domain template (strict predicate enforcement)")
    parser.add_argument("--soft_template", dest="hard_template", action="store_false", help="Use soft domain template (flexible predicate usage)")

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
        data_dir = "/local-ssd/alfred/alfred_train_cleaned"
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

    # Generate / refine PDDL problems
    if (args.generate_end_to_end or args.generate_multi_step or args.generate_plan or 
        args.generate_multi_step_with_vlm or args.generate_multi_step_with_cv or 
        args.generate_multi_step_with_sgclip_vlm or args.generate_vila_planning or
        args.generate_villain_pddl or args.generate_villain_direct_pddl or 
        args.generate_villain_captioning_pddl or args.generate_villain_captioning_dino_pddl or
        args.generate_scene_graph_pddl or args.generate_scene_graph_dino_pddl) or (args.generate_villain_gpt41_pddl or args.generate_villain_captioning_gpt41_pddl or args.generate_scene_graph_gpt41_pddl):
        # Create folders
        folders = ["responses", "instructions", "logs"]
        if args.generate_plan or args.generate_vila_planning:
            folders += ["plans"]
        else:
            folders += ["problems"]

        for dname in folders:
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

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
        for i, task_name in enumerate(task_names):
            # task_idx = task_name.split("problem")[1] # problem might not have a number, eg. Alfred
            
            # Load problem data using new helper function
            problem_data = load_problem_data(data_dir, task_name, args.enable_caption, args.clean_image)

            targets += [{
                "problem": None,    
                "response": None,
                "observations": problem_data["observations"],
                "instruction": problem_data["instruction"],
                "domain": problem_data["domain_file"],
                "plan": problem_data["plan"],
                "error": None,
            }]

        # Start generating
        for i, (task_name, target) in tqdm(
            enumerate(zip(task_names, targets)), 
            total=len(task_names), 
            desc="Generating PDDL problems"
        ):

            # Check appropriate directory based on pipeline type
            if args.generate_plan or args.generate_vila_planning:
                target_check_dir = f"{result_dir}/{args.gen_step}/plans"
            else:
                target_check_dir = f"{result_dir}/{args.gen_step}/problems"
            
            if any(path.startswith(f"{task_name}") for path in os.listdir(target_check_dir)):
                print(f"👀 {task_name} already exists, checking if has plan.")
                if args.find_plan:
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
                
            # save PDDL objects
            save_step = args.gen_step

            try:
                if (args.generate_end_to_end or args.generate_multi_step or 
                    args.generate_multi_step_with_vlm or args.generate_multi_step_with_cv or 
                    args.generate_multi_step_with_sgclip_vlm or args.generate_villain_pddl or
                    args.generate_villain_gpt41_pddl or args.generate_villain_direct_pddl or 
                    args.generate_villain_captioning_pddl or args.generate_villain_captioning_dino_pddl or
                    args.generate_villain_captioning_gpt41_pddl or args.generate_scene_graph_pddl or
                    args.generate_scene_graph_dino_pddl or args.generate_scene_graph_gpt41_pddl):
                    dir_pairs = [
                        ("problems", "file", "pddl"),
                        ("instructions", "prompt", "txt"),
                        ("responses", "response", "txt"),
                    ]
                    for retry_idx in range(len(res["problem"]["file"])):
                        problem_name = f"{task_name}-attempt-{retry_idx+1}"
                        if success and retry_idx == len(res["problem"]["file"]) - 1:
                            problem_name = f"{task_name}"

                        for dir_name, file_name, file_ext in dir_pairs:
                            with open(f"{result_dir}/{save_step}/{dir_name}/{problem_name}.{file_ext}", "w") as fw:
                                fw.write(res["problem"][file_name][retry_idx])
                
                elif args.generate_plan or args.generate_vila_planning:
                    dir_pairs = [
                        ("plans", "plan"),
                        ("instructions", "prompt"),
                        ("responses", "response"),
                    ]
                    for dir_name, file_name in dir_pairs:
                        with open(f"{result_dir}/{save_step}/{dir_name}/{task_name}.txt", "w") as fw:
                            fw.write(res[file_name])
            
            except Exception as e:
                print(f"Error saving PDDL: {traceback.format_exc()}")

    # find plan using fast-downward
    if args.find_plan:
        for dname in ("plans", "errors"):
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        problems_dir = f"{result_dir}/{args.gen_step}/problems"
        if not os.path.exists(problems_dir):
            problems = []
        else:
            problems = sorted([
                os.path.join(problems_dir, f) 
            for f 
                in os.listdir(problems_dir)
            if "-attempt-" not in f
        ])
        num_problems = len(problems)

        success_count = 0        

        for problem in tqdm(
            problems,
            desc="Finding plans"
        ):
            idx = os.path.basename(problem).split("problem")[1].split(".pddl")[0]
            domain_path = f"{data_dir}/domain.pddl"

            plan_path = problem.replace("problems", "plans").replace(".pddl", ".txt")

            command = format_command(
                domain_path,
                problem,
                plan_path,
                args.downward_dir,
                args.time_limit,
            )

            solver_success, err = find_plan(
                command,
                plan_path,
            )

            plan_success = False
            if solver_success:  # check plan
                with open(f"{plan_path}", "r") as fr:
                    plan = fr.readlines()
                with open(f"{plan_path.replace(f'{result_dir}', f'../results/{args.domain}_gt')}", "r") as fr:
                    gt_plan = fr.readlines()
                
                plan_success, err = compare_plans(gt_plan, plan)
            
            if not plan_success:
                with open(f"{problem}", "r") as fr:
                    problem_str = fr.read()
                with open(f"{problem.replace(f'{result_dir}', f'../results/{args.domain}_gt').replace('txt', 'pddl')}", "r") as fr:
                    gt_problem_str = fr.read()

                err += f"Problem:\n(:init\n{problem_str.split('(:init')[1]}\n\n"   
                err += f"Ground truth problem:\n(:init\n{gt_problem_str.split('(:init')[1]}\n\n"   

                with open(problem.replace("problems", "errors").replace(".pddl", ".txt"), "w") as fw:
                    fw.write(err)

            else:
                success_count += 1

        print(f"Plan success rate {success_count} / {num_problems}")


if __name__ == "__main__":
    main()