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
from PIL import Image
from utils import seed_everything, parse_args, PDDL, get_error_meaning

from dotenv import load_dotenv
load_dotenv('.env')
from openai import OpenAI
client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY"),
)

def run_model(prompt, observation, client_name="gpt-4.1-2025-04-14"):
    with open(observation, "rb") as image_file:
        base64_image = base64.b64encode(image_file.read()).decode("utf-8")
    
    response = client.responses.create(
        model=client_name,
        input=[{
            "role": "user",
            "content": [
                {"type": "input_text", "text": prompt},
                {
                    "type": "input_image",
                    "image_url": f"data:image/jpeg;base64,{base64_image}"
                },
            ],
        }],
    )
    full_answer = response.output_text
    return full_answer

def build_pf_prompt(examples, target, domain_name):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL file with objects, initial state, and goal specification.
    Your output should adhere to the constraints defined in the domain file.
    You must output the PDDL file in the correct format.

    Examples of PDDL problems given a different domain instruction:
    """

    for example in examples:
        prompt += f"""
        Instruction: {example["instruction"]}
        PDDL problem:
        {example["problem"]}\n\n
        """

    prompt += f"""
    For the current domain, {domain_name}, this is the domain file:
    {target["domain"]}
    """

    prompt += f"""
    The image of the scene has been provided.
    Instruction: {target["instruction"]}

    Please first analyze the image and then generate the PDDL problem.
    Do not generate anything after the PDDL problem.
    """
    
    return prompt

def build_refine_pf_prompt(examples, target, domain_name):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL file with objects, initial state, and goal specification.
    Your output should adhere to the constraints defined in the domain file.
    You must output the PDDL file in the correct format.

    Examples of PDDL problems given a different domain instruction:
    """

    for example in examples:
        prompt += f"""
        Instruction: {example["instruction"]}
        PDDL problem:
        {example["problem"]}\n\n
        """

    prompt += f"""
    For the current domain, {domain_name}, this is the domain file:
    {target["domain"]}
    """

    prompt += f"""
    The image of the scene has been provided.
    Instruction: {target["instruction"]}

    The following is the PDDL problem you generated last time:
    {target["problem"]}

    The following is the error you made last time:
    {target["error"]}

    Please first analyze where the error is.
    Then generate the PDDL problem based on the error. Do not generate anything after the PDDL problem.
    """
    
    return prompt

def generate_problem(target, examples, domain_name, refine=False):
    observation = target["observation"]

    if refine:
        prompt = build_refine_pf_prompt(examples, target, domain_name)
    else:
        prompt = build_pf_prompt(examples, target, domain_name)
    
    response = run_model(prompt, observation) 

    # Match the PDDL file in the response by header and footer
    pf_regex_pattern = r'(\(define.*\))'
    pddl_match = re.search(pf_regex_pattern, response, re.DOTALL)
    if pddl_match:
        pddl_file = pddl_match.group(1).strip()
    else:
        print(f"Response: {response}\n\n")
        raise ValueError("No PDDL file found in the response")

    return pddl_file, response, prompt

def find_plan(domain_path, problem_path, plan_path, downward_dir, time_limit):
    def get_cost(line: str):
        # ; cost = COST *
        if line.startswith("; cost = "):
            cost = float(line.split()[3])
        else:
            cost = 1e5

        return cost

    sas_path = f"{plan_path}.sas"

    command = f"python {downward_dir}/fast-downward.py " + \
                f"--alias lama " + \
                f"--search-time-limit {time_limit} " + \
                f"--plan-file {plan_path} " + \
                f"--sas-file {sas_path} " + \
                f"{domain_path} " + \
                f"{problem_path}"

    try:
        output = subprocess.check_output(
            command,
            shell=True,
            stderr=subprocess.DEVNULL,
        )

        best_cost = 1e10
        best_plan = None

        for fname in glob.glob(f"{plan_path}.*"):
            with open(fname, "r") as fr:
                plans = fr.readlines()
                cost = get_cost(plans[-1]) # the cost is written in the last line

            if cost < best_cost:
                best_cost = cost
                best_plan = "\n".join([p.strip() for p in plans[:-1]])

        return True, None

    except Exception as e:
        return False, e.output.decode()

def main():
    args = parse_args()
    data_dir = f"../data/{args.domain_name}"
    if args.result_dir is None:
        result_dir = f"../results/{args.domain_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    else:
        result_dir = f"../results/{args.domain_name}_{args.result_dir}"

    seed_everything(args.seed) 

    task_names = [
        fname.rsplit(".", 1)[0]
        for fname in os.listdir(f"{data_dir}/problems")
    ]  # problem1.pddl, problem2.pddl, ...

    with open(f"{data_dir}/domain.pddl", "r") as f:
        domain_file = f.read()

    folders = ["problems", "responses", "instructions"]

    # Generate / refine PDDL problems
    if args.generate_problem or args.refine_problem:
        for dname in folders:
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )
        if args.refine_problem:
            idx = len(os.listdir(f"{result_dir}"))
            # If has only base, will be refine_1
            # If has base and refine_1, will be refine_2
            refine_step = f"refine_{idx}"
            for dname in folders:
                os.makedirs(
                    f"{result_dir}/{refine_step}/{dname}",
                    exist_ok=True
                )

        examples = []
        all_targets = []

        # Set up example domain
        domains = ["cooking", "hanoi", "blocksworld"]
        domains.remove(args.domain_name) # choose another domain as example
        example_domain_name = random.choice(domains)
        example_domain_dir = data_dir.replace(args.domain_name, example_domain_name)

        # Load examples
        for idx in range(args.num_examples):
            example_problem_filepath = f"{example_domain_dir}/problems/problem{idx+1}.pddl"
            example_instruction_filepath = f"{example_domain_dir}/instructions/problem{idx+1}.txt"
            with open(example_problem_filepath, "r") as f:
                example_problem_file = f.read()
            with open(example_instruction_filepath, "r") as f:
                example_instruction = f.read()
            with open(f"{example_domain_dir}/domain.pddl", "r") as f:
                example_domain = f.read()

            examples += [{
                "problem": example_problem_file,
                "instruction": example_instruction,
                "domain": example_domain,
            }]

        # Set up problem tasks
        num_tasks = len(os.listdir(f"{data_dir}/problems"))
        for task_idx in range(1, num_tasks+1):
            instruction = open(f"{data_dir}/instructions/problem{task_idx}.txt").read()  # instruction for VLM
            observation = f"{data_dir}/observations/problem{task_idx}.jpg"  # image path of the scene

            all_targets += [{
                "problem": None,    
                "response": None,
                "observation": observation,
                "instruction": instruction,
                "domain": domain_file,
            }]
 
            # Set up error file for refinement
            if args.refine_problem:
                target = all_targets[-1]
                error_path = f"{result_dir}/{args.gen_step}/errors/problem{task_idx}.txt"
                problem_path = f"{result_dir}/{args.gen_step}/problems/problem{task_idx}.pddl"
                if os.path.exists(error_path) and os.path.exists(problem_path):
                    with open(error_path, "r") as f:
                        error = f.read()
                    if "Search stopped without finding a solution" in error:  
                        target["error"] = "There is no possible plan after exhaustive search."
                    else:
                        target["error"] = "The solver fails because of syntax errors."
                    with open(problem_path, "r") as f:
                        target["problem"] = f.read()
                else:
                    # print(f"Problem {task_idx} has no error, skipping...")
                    target["error"] = None

        # Start generating
        gen_idx = 1
        for task_name_idx in tqdm(
            range(len(task_names)), 
            total=len(task_names), 
            desc="Generating PDDL problems"
        ):
            target = all_targets[task_name_idx]

            # generate PDDL objects, initial state, and goal specification
            if args.generate_problem:
                pddl_file, response, prompt = generate_problem(
                    target,
                    examples,
                    domain_name=args.domain_name,
                    refine=False,
                )

            elif args.refine_problem:
                if target["error"] is None:
                    print(f"Problem {gen_idx} has no error, skipping...")
                    gen_idx += 1
                    continue

                pddl_file, response, prompt = generate_problem(
                    target,
                    examples,
                    domain_name=args.domain_name,
                    refine=True
                )

            target["problem"] = pddl_file
            target["response"] = response

            # save PDDL objects
            if args.generate_problem:
                save_step = args.gen_step
            elif args.refine_problem:
                save_step = refine_step

            try:
                with open(f"{result_dir}/{save_step}/instructions/problem{gen_idx}.txt", "w") as fw:
                    fw.write(prompt)

                with open(f"{result_dir}/{save_step}/problems/problem{gen_idx}.pddl", "w") as fw:
                    fw.write(pddl_file)

                with open(f"{result_dir}/{save_step}/responses/problem{gen_idx}.txt", "w") as fw:
                    fw.write(response)
            
            except Exception as e:
                print(f"Error saving PDDL: {traceback.format_exc()}")

            gen_idx += 1

    # find plan using fast-downward
    if args.find_plan:
        for dname in ("plans", "errors"):
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        problems = [
            os.path.join(f"{result_dir}/{args.gen_step}/problems", f) 
            for f 
            in os.listdir(f"{result_dir}/{args.gen_step}/problems")
        ]
        num_problems = len(problems)

        for idx in tqdm(
            range(num_problems),
            total=num_problems,
            desc="Finding plans"
        ):
            domain_path = f"{data_dir}/domain.pddl"

            found, err = find_plan(
                domain_path,
                problems[idx],
                problems[idx].replace("problems", "plans").replace(".pddl", ""),
                args.downward_dir,
                args.time_limit,
            )

            if not found:
                with open(problems[idx].replace("problems", "errors").replace(".pddl", ".txt"), "w") as fw:
                    fw.write(err)


if __name__ == "__main__":
    main()


