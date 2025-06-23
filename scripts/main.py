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
from PIL import Image
import torch

from utils.prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_domain_prompt, 
    build_refine_domain_prompt, 
    build_plan_prompt,
)
from utils.helpers import (
    seed_everything, 
    parse_args,
    format_command,
    create_file_paths,
)
from utils.parsers import (
    parse_pddl,
    parse_plan,
)
from utils.checkers import find_plan, compare_plans
from utils.generate import generate_pddl_end_to_end
from utils.models import VLMClient

from dotenv import load_dotenv
load_dotenv('.env')

# Main

def main():
    args = parse_args()
    # Args check
    assert not (args.generate_plan and args.generate_problem), \
        "generate_plan is not compatible with generate_problem"

    data_dir = f"../data/{args.domain}"
    result_dir = f"../results/{args.domain}"
    if args.result_dir is not None:
        result_dir += f"_{args.result_dir}"
    if args.model is not None:
        result_dir += f"_{args.model.replace('/', '-')}"
    if args.generate_plan:
        result_dir += "_plan"

    seed_everything(args.seed) 

    task_names = sorted([
        fname.split(".")[0]
        for fname in os.listdir(f"{data_dir}/problems")
    ])  # problem1, problem2, ...

    with open(f"{data_dir}/domain.pddl", "r") as f:
        domain_file = f.read()

    # Generate / refine PDDL problems
    if args.generate_problem or args.generate_plan:
        # Create folders
        folders = ["responses", "instructions"]
        if args.generate_plan:
            folders += ["plans"]
        else:
            folders += ["problems"]

        for dname in folders:
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

         # Load model
        model = VLMClient(args.model, args.device)

        # Load config
        if os.path.exists(f"{data_dir}/config.json"):
            with open(f"{data_dir}/config.json", "r") as f:
                config = json.load(f)
        else:
            config = None

        # Set up problem tasks: instructions, observations...
        targets = []
        for i, task_name in enumerate(task_names):
            task_idx = task_name.split("problem")[1]
            # Load the instruction
            with open(f"{data_dir}/instructions/{task_name}.txt", "r") as f:
                instruction = f.read()
            # Load the observations
            observations = []
            for img_name in os.listdir(f"{data_dir}/observations"):
                if args.clean_image:
                    if img_name == f"{task_name}-clean.jpg":
                        observations.append(f"{data_dir}/observations/{img_name}")
                else:
                    if img_name.startswith(f"{task_name}.jpg") or (img_name.startswith(f"{task_name}-") and "clean" not in img_name):
                        observations.append(f"{data_dir}/observations/{img_name}")

            targets += [{
                "problem": None,    
                "response": None,
                "observations": observations,
                "instruction": instruction,
                "domain": domain_file,
                "error": None,
            }]

        # Start generating
        for i, (task_name, target) in tqdm(
            enumerate(zip(task_names, targets)), 
            total=len(task_names), 
            desc="Generating PDDL problems"
        ):

            target_problem_dir = f"{result_dir}/{args.gen_step}/problems"
            if any(path.startswith(f"{task_name}") for path in os.listdir(target_problem_dir)):
                print(f"{task_name} already exists, skipping...")
                continue

            # generate PDDL objects, initial state, and goal specification
            res, success = generate_pddl_end_to_end(
                target,
                config,
                model=model,
                generate_caption=args.generate_caption,
                generate_scene_graph=args.generate_scene_graph,
                num_tries=args.num_tries,
            )
            
            # save PDDL objects
            save_step = args.gen_step

            try:
                if args.generate_problem:
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
                
                elif args.generate_plan:
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

        problems = sorted([
            os.path.join(f"{result_dir}/{args.gen_step}/problems", f) 
            for f 
            in os.listdir(f"{result_dir}/{args.gen_step}/problems")
            if "-" not in f
        ])  # Need to sort
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