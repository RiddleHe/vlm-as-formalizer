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

from prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_domain_prompt, 
    build_refine_domain_prompt, 
    build_plan_prompt,
)
from utils import (
    seed_everything, 
    parse_args,
    format_command,
    create_file_paths,
)
from parsers import (
    parse_pddl,
    parse_plan,
    check_pddl,
    check_plan,
)

from models import VLMClient

from dotenv import load_dotenv
load_dotenv('.env')

def generate_answers(
        target, 
        config, 
        domain_name, 
        model, 
        generate_domain=False, 
        generate_plan=False,
        generate_caption=False,
        generate_scene_graph=False,
        num_tries=1,
        downward_dir='../downward',
        time_limit=30,
    ):
    observations = target["observations"]
    success = False

    if generate_plan:
        res = {
            "plan": None,
            "response": None,
            "prompt": None,
        }

        plan_prompt = build_plan_prompt(
            target, 
            domain_name, 
            config, 
            generate_caption=generate_caption, 
            generate_scene_graph=generate_scene_graph,
        )
        response = model.generate(plan_prompt, observations)

        plan_file = parse_plan(response)
        res["plan"] = plan_file
        res["response"] = response
        res["prompt"] = plan_prompt

    else:
        res = {
            "problem": {
                "file": [],
                "response": [],
                "prompt": []
            },
            "domain": {
                "file": [],
                "response": [],
                "prompt": [],
            }
        }

        msg = None
        for retry_idx in range(num_tries):
            if generate_domain:
                pass

            if retry_idx > 0:
                problem_prompt = build_refine_problem_prompt(
                    target, 
                    domain_name, 
                    config, 
                    generate_caption=generate_caption, 
                    generate_scene_graph=generate_scene_graph
                )
            else:
                problem_prompt = build_problem_prompt(
                    target, 
                    domain_name, 
                    config, 
                    generate_caption=generate_caption, 
                    generate_scene_graph=generate_scene_graph
                )
            
            response = model.generate(problem_prompt, observations)

            # Match the PDDL file in the response by header and footer
            problem_file = parse_pddl(response)
            if problem_file is None:
                problem_file = ""

            success, msg = check_error(problem_file, target["domain"], downward_dir, time_limit)

            if not success:
                print(f"Attempt {retry_idx+1} failed: \n{msg}")

                target["response"] = response
                target["error"] = msg


            res["problem"]["file"].append(problem_file)
            res["problem"]["response"].append(response)
            res["problem"]["prompt"].append(problem_prompt)

            if success:
                break

    return res, success

def check_error(problem_file, domain_file, downward_dir, time_limit):
    ret, msg = False, None
    
    ret, msg = check_pddl(problem_file, domain_file)
    if ret:
        with tempfile.TemporaryDirectory() as temp_dir_path:
            domain_path, problem_path, plan_path = create_file_paths(domain_file, problem_file, temp_dir_path)
            command = format_command(domain_path, problem_path, plan_path, downward_dir, time_limit)
            ret, msg = find_plan(command, plan_path)

        if not ret:
            if "Search stopped without finding a solution" in msg:
                msg = "Search stopped without finding a solution"
            else:
                msg = msg[:100] + "..."

    return ret, msg

def find_plan(command, plan_path):
    def get_cost(line: str):
        # ; cost = COST *
        if line.startswith("; cost = "):
            cost = float(line.split()[3])
        else:
            cost = 1e5

        return cost

    try:
        output = subprocess.check_output(
            command,
            shell=True,
            stderr=subprocess.STDOUT,
        )

        best_cost = 1e10
        best_plan = None

        plan_files = glob.glob(f"{plan_path}.*")

        for fname in plan_files:
            with open(fname, "r") as fr:
                plans = fr.readlines()
                cost = get_cost(plans[-1]) # the cost is written in the last line

            if cost < best_cost:
                best_cost = cost
                best_plan = "\n".join([p.strip() for p in plans[:-1]])

        if best_plan is not None:
            with open(f"{plan_path}.txt", "w") as fw:
                fw.write(best_plan)

            for fname in plan_files:
                os.remove(fname)

        return True, None

    except Exception as e:
        return False, e.output.decode().strip()

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
    if args.generate_domain:
        result_dir += "_domain"
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
            if args.generate_domain:
                folders += ["domains"]

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
                    if img_name.startswith(f"{task_name}-") and "clean" not in img_name:
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

            target_problem_path = f"{result_dir}/{args.gen_step}/problems/{task_name}.pddl"
            if os.path.exists(target_problem_path):
                print(f"{task_name} already exists, skipping...")
                continue

            # generate PDDL objects, initial state, and goal specification
            res, success = generate_answers(
                target,
                config,
                domain_name=args.domain,
                model=model,
                generate_domain=args.generate_domain,
                generate_plan=args.generate_plan,
                generate_caption=args.generate_caption,
                generate_scene_graph=args.generate_scene_graph,
                num_tries=args.num_tries,
            )
            
            # save PDDL objects
            save_step = args.gen_step

            try:
                if args.generate_problem:
                    for retry_idx in range(len(res["problem"]["file"])):
                        problem_name = f"{task_name}-attempt-{retry_idx+1}"
                        if success and retry_idx == len(res["problem"]["file"]) - 1:
                            problem_name = f"{task_name}"

                        with open(f"{result_dir}/{save_step}/instructions/{problem_name}.txt", "w") as fw:
                            fw.write(res["problem"]["prompt"][retry_idx])

                        with open(f"{result_dir}/{save_step}/problems/{problem_name}.pddl", "w") as fw:
                            fw.write(res["problem"]["file"][retry_idx])

                        with open(f"{result_dir}/{save_step}/responses/{problem_name}.txt", "w") as fw:
                            fw.write(res["problem"]["response"][retry_idx])

                    if args.generate_domain:
                        pass
                
                elif args.generate_plan:
                    with open(f"{result_dir}/{save_step}/instructions/{task_name}.txt", "w") as fw:
                        fw.write(res["prompt"])

                    with open(f"{result_dir}/{save_step}/plans/{task_name}.txt", "w") as fw:
                        fw.write(res["plan"])
                        
                    with open(f"{result_dir}/{save_step}/responses/{task_name}.txt", "w") as fw:
                        fw.write(res["response"])
            
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

        error_count = 0

        for problem in tqdm(
            problems,
            desc="Finding plans"
        ):
            idx = os.path.basename(problem).split("problem")[1].split(".pddl")[0]
            domain_path = f"{data_dir}/domain.pddl"
            if args.generate_domain:
                domain_path = f"{result_dir}/{args.gen_step}/domains/domain{idx}.pddl"

            plan_path = problem.replace("problems", "plans").replace(".pddl", "")

            command = format_command(
                domain_path,
                problem,
                plan_path,
                args.downward_dir,
                args.time_limit,
            )

            success, err = find_plan(
                command,
                plan_path,
            )

            if success:  # check plan
                with open(f"{plan_path}.txt", "r") as fr:
                    plan = fr.readlines()
                with open(f"{plan_path.replace(f'{result_dir}', f'../results/{args.domain}_gt')}.txt", "r") as fr:
                    gt_plan = fr.readlines()
                
                success, err = check_plan(gt_plan, plan)
            
            if not success:
                with open(problem.replace("problems", "errors").replace(".pddl", ".txt"), "w") as fw:
                    fw.write(err)

                error_count += 1

        print(f"Total errors: {error_count} / {num_problems}")


if __name__ == "__main__":
    main()