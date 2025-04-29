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
from utils import seed_everything, parse_args
import torch

from dotenv import load_dotenv
load_dotenv('.env')

# Model loader

class VLMClient:
    def __init__(self, client_name, device):
        # Determine client type
        if any(name in client_name for name in ["gpt", "o3", "o4"]):  # OpenAI models
            self.type = "openai"
            if "gpt" in client_name:
                self.client_name = client_name + "-2025-04-14"
            elif "o3-mini" in client_name:
                self.client_name = client_name + "-2025-01-31"
            elif "o4-mini" in client_name:
                self.client_name = client_name + "-2025-04-16"

        elif "/" in client_name:
            self.type = "huggingface"
            self.client_name = client_name
        if self.client_name is None:
            raise ValueError(f"Unknown client type: {client_name}")
        
        # Load client
        if self.type == "openai":
            from openai import OpenAI
            self.client = OpenAI(
                api_key=os.getenv("OPENAI_API_KEY"),
            )
        elif self.type == "huggingface":
            from transformers import pipeline
            self.client = pipeline(
                "image-text-to-text",
                model=client_name,
                device=device,
                torch_dtype=torch.bfloat16
            )
            # print(f"Model config: {self.client.model.config}")
        print(f"Loaded {self.type} client: {self.client_name}")

    def generate(self, prompt: str, observation: str):
        # Convert image to base64
        with open(observation, "rb") as image_file:
            base64_image = base64.b64encode(image_file.read()).decode("utf-8")

        # Generate response
        if self.type == "openai":
            response = self.client.responses.create(
                model=self.client_name,
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

        elif self.type == "huggingface":
            messages = [
                {
                "role": "user",
                "content": [
                    {"type": "image", "path": observation},
                    {"type": "text", "text": prompt},
                    ],
                },
            ]
            response = self.client(text=messages, max_new_tokens=1024)
            full_answer = response[0]["generated_text"][1]["content"]

        return full_answer

# Prompt builder

def build_problem_prompt(target, domain_name, add_examples=True):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL file with objects, initial state, and goal specification.
    Your output should adhere to the constraints defined in the domain file.
    You must output the PDDL file in the correct format.
    """

    example_prompt = f"""Examples of PDDL problems given a different domain instruction:
    Domain: hanoi
    Instruction: Move all disks to the rightmost peg.
    PDDL problem:
    (define (problem hanoi3)
        (:domain hanoi)
        (:objects
            peg1
            peg2
            orange_disk1
            orange_disk2
        )
            (:init
                (clear orange_disk1)
                (on orange_disk1 orange_disk2)
                (on orange_disk2 peg1)
            )
        (:goal (and (on orange_disk2 peg2) (on orange_disk1 orange_disk2)))
    )
    """

    if add_examples:
        prompt += example_prompt

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

def build_refine_problem_prompt(target, domain_name):
    prompt = build_problem_prompt(target, domain_name, add_examples=False)

    prompt += f"""
    The following is the PDDL problem file you generated last time:
    {target["problem"]}

    The following is the error you made last time:
    {target["error"]}

    Please first analyze where the error is.
    Then generate the PDDL problem based on the error. Do not generate anything after the PDDL problem.
    """
    
    return prompt

def build_domain_prompt(target, domain_name, add_examples=True):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL domain file which contains object types, predicates, and actions suitable for the instruction.
    You will be given all possible actions of the robot along with the arguments of the actions.
    You will complete the action definitions by adding precondtions and effects, and also complete the object types and predicates.
    """

    example_prompt = f"""Examples of PDDL domains given a different domain instruction:
    Domain: hanoi
    Instruction: Move all disks to the rightmost peg while keeping a rule that larger disks are below.
    PDDL domain:
    (define (domain hanoi)
        (:requirements :strips)
        (:predicates
            (clear ?x)
            (on ?x ?y)
            (smaller ?x ?y)
            (move ?disc ?to)
        )
        (:action move
            :parameters (?disc ?from ?to)
            :precondition (and (smaller ?to ?disc) (on ?disc ?from)
                        (clear ?disc) (clear ?to))
            :effect  (and (clear ?from) (on ?disc ?to) (not (on ?disc ?from))
                    (not (clear ?to)))
        )
    )
    """

    if add_examples:
        prompt += example_prompt
    
    prompt += f"""
    For the current domain, {domain_name}, the image of the scene has been provided.
    Instruction: {target["instruction"]}

    All possible actions that should be included in the domain file:
    {parse_actions(target["domain"])}

    Please complete the domain file based on the image, the instruction, and the possible actions. 
    Do not generate anything after the PDDL domain file.
    """

    return prompt

def build_refine_domain_prompt(target, domain_name):
    prompt = build_domain_prompt(target, domain_name, add_examples=False)

    prompt += f"""
    The following is the PDDL domain file you generated last time:
    {target["domain"]}

    The following is the PDDL problem file you generated last time:
    {target["problem"]}

    The following is the error you made last time:
    {target["error"]}

    Please first analyze where the error is.
    If the error is due to the domain file, please generate the PDDL domain file based on the error.
    If the error is not due to the domain file, explain why it is not, and don't generate any PDDL domain file.
    """

    return prompt

def build_plan_prompt(target, domain_name):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate a step-by-step plan for the robot.
    All the possible actions and their arguments are given below:
    {parse_actions(target["domain"])}

    You must first reason what objects are in the scene that can be the arguments of the actions.
    Then you must reason what actions to take in the plan. Be mindful of the preconditions and effects of the actions.
    Each action should take one line in the plan.
    The plan should be in the following format:
    (action1 arg1 arg2 arg3)
    (action2 arg1 arg2 arg3)
    ...

    For the current domain, {domain_name}, the image of the scene has been provided.
    Instruction: {target["instruction"]}
    Please generate the plan for the robot. Do not generate anything after the plan.
    """

    return prompt

# PDDL parser

def parse_actions(domain_file):
    regex_patern = r'\(:action\s+(\w+).*?:parameters\s*\((.*?)\)'
    compiled_regex = re.compile(regex_patern, re.DOTALL) 
    matches = compiled_regex.findall(domain_file)
    actions = []
    for match in matches:
        action_name = match[0]
        parameters = re.sub(r'\s+', ' ', match[1].strip())
        actions.append(f"action: {action_name}\nparameters: {parameters}")
    return "\n".join(actions)

def parse_pddl(response):  # Use parentheses matching to find the PDDL file
    start_index = response.find("(define")
    if start_index == -1:
        return None
    
    open_paren_count = 0
    end_index = -1

    first_paren_index = response.find("(", start_index)
    if first_paren_index == -1:
        return None
    
    for i in range(first_paren_index, len(response)):
        if response[i] == '(':
            open_paren_count += 1
        elif response[i] == ')':
            open_paren_count -= 1
            if open_paren_count == 0:
                end_index = i+1
                break
    
    if end_index != -1:
        pddl_file = response[start_index:end_index].strip()
        return pddl_file
    
    else:
        return None

def parse_plan(response):
    regex_pattern = r'(\(.*?\))'
    matches = re.findall(regex_pattern, response)
    plan = []
    for match in matches:
        plan.append(match.strip())
    return "\n".join(plan)

# Main actions

def generate_answers(target, examples, domain_name, model, refine_problem=False, generate_domain=False, generate_plan=False):
    observation = target["observation"]

    if generate_plan:
        res = {
            "plan": None,
            "response": None,
            "prompt": None,
        }

        plan_prompt = build_plan_prompt(target, domain_name)
        response = model.generate(plan_prompt, observation)

        plan_file = parse_plan(response)
        res["plan"] = plan_file
        res["response"] = response
        res["prompt"] = plan_prompt

    else:
        res = {
            "problem": {
                "file": None,
                "response": None,
                "prompt": None,
            },
            "domain": {
                "file": None,
                "response": None,
                "prompt": None,
            }
        }

        if generate_domain:
            if refine_problem:
                domain_prompt = build_refine_domain_prompt(target, domain_name)

            else:
                domain_prompt = build_domain_prompt(target, domain_name)

            domain_response = model.generate(domain_prompt, observation)
            domain_file = parse_pddl(domain_response)
            if domain_file is None:
                domain_file = ""

            # Keep original domain if the model does not generate any PDDL
            if refine_problem:
                if domain_file == "":
                    domain_file = target["domain"]
                    res["domain"]["new_domain"] = False
                else:
                    res["domain"]["new_domain"] = True

            target["domain"] = domain_file

            res["domain"]["file"] = domain_file
            res["domain"]["response"] = domain_response
            res["domain"]["prompt"] = domain_prompt

        if refine_problem:
            problem_prompt = build_refine_problem_prompt(target, domain_name)
        else:
            problem_prompt = build_problem_prompt(target, domain_name)
        
        response = model.generate(problem_prompt, observation) 

        # Match the PDDL file in the response by header and footer
        problem_file = parse_pddl(response)
        if problem_file is None:
            problem_file = ""

        res["problem"]["file"] = problem_file
        res["problem"]["response"] = response
        res["problem"]["prompt"] = problem_prompt

    return res

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

# Main

def main():
    args = parse_args()
    if args.generate_plan:
        assert not args.generate_problem and not args.refine_problem, \
            "generate_plan is not compatible with generate_problem or refine_problem"

    data_dir = f"../data/{args.domain_name}"
    if args.result_dir is None:
        result_dir = f"../results/{args.domain_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    else:
        result_dir = f"../results/{args.domain_name}_{args.result_dir}"
    if args.model is not None:
        result_dir += f"_{args.model.replace('/', '-')}"
    if args.generate_domain:
        result_dir += "_domain"
    if args.generate_plan:
        result_dir += "_plan"

    seed_everything(args.seed) 

    task_names = [
        fname.rsplit(".", 1)[0]
        for fname in os.listdir(f"{data_dir}/problems")
    ]  # problem1.pddl, problem2.pddl, ...

    with open(f"{data_dir}/domain.pddl", "r") as f:
        domain_file = f.read()

    # Generate / refine PDDL problems
    if args.generate_problem or args.refine_problem or args.generate_plan:
        # Create folders
        if args.generate_plan:
            folders = ["plans", "responses", "instructions"]
        else:
            folders = ["problems", "responses", "instructions"]
            if args.generate_domain:
                folders += ["domains"]

        for dname in folders:
            os.makedirs(
                f"{result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )
         # Load model
        model = VLMClient(args.model, args.device)
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
                "domain_name": example_domain_name,
            }]

        # Set up problem tasks
        num_tasks = len(os.listdir(f"{data_dir}/problems"))
        for task_idx in range(1, num_tasks+1):
            with open(f"{data_dir}/instructions/problem{task_idx}.txt", "r") as f:
                instruction = f.read()
            observation = f"{data_dir}/observations/problem{task_idx}.jpg"  # image path of the scene

            if args.generate_domain and args.refine_problem:
                with open(f"{result_dir}/{args.gen_step}/domains/domain{task_idx}.pddl", "r") as f:
                    domain_file = f.read()

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
            if args.refine_problem:
                if target["error"] is None:
                    print(f"Problem {gen_idx} has no error, skipping...")
                    gen_idx += 1
                    continue

            res = generate_answers(
                target,
                examples,
                domain_name=args.domain_name,
                model=model,
                refine_problem=args.refine_problem,
                generate_domain=args.generate_domain,
                generate_plan=args.generate_plan,
            )
            
            # save PDDL objects
            if args.generate_problem or args.generate_plan:
                save_step = args.gen_step
            elif args.refine_problem:
                save_step = refine_step

            try:
                if args.generate_problem or args.refine_problem:
                    with open(f"{result_dir}/{save_step}/instructions/problem{gen_idx}.txt", "w") as fw:
                        fw.write(res["problem"]["prompt"])

                    with open(f"{result_dir}/{save_step}/problems/problem{gen_idx}.pddl", "w") as fw:
                        fw.write(res["problem"]["file"])

                    with open(f"{result_dir}/{save_step}/responses/problem{gen_idx}.txt", "w") as fw:
                        fw.write(res["problem"]["response"])

                    if args.generate_domain:
                        with open(f"{result_dir}/{save_step}/domains/domain{gen_idx}.pddl", "w") as fw:
                            fw.write(res["domain"]["file"])

                        with open(f"{result_dir}/{save_step}/responses/domain{gen_idx}.txt", "w") as fw:
                            fw.write(res["domain"]["response"])

                        with open(f"{result_dir}/{save_step}/instructions/domain{gen_idx}.txt", "w") as fw:
                            fw.write(res["domain"]["prompt"])

                        if args.refine_problem:
                            if res["domain"]["new_domain"]:
                                with open(f"{result_dir}/{save_step}/domains/domain{gen_idx}_legacy.pddl", "w") as fw:
                                    fw.write(target["domain"])
                
                elif args.generate_plan:
                    with open(f"{result_dir}/{save_step}/instructions/problem{gen_idx}.txt", "w") as fw:
                        fw.write(res["prompt"])

                    with open(f"{result_dir}/{save_step}/plans/plan{gen_idx}.txt", "w") as fw:
                        fw.write(res["plan"])
                        
                    with open(f"{result_dir}/{save_step}/responses/problem{gen_idx}.txt", "w") as fw:
                        fw.write(res["response"])
            
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

        problems = sorted([
            os.path.join(f"{result_dir}/{args.gen_step}/problems", f) 
            for f 
            in os.listdir(f"{result_dir}/{args.gen_step}/problems")
        ])  # Need to sort
        num_problems = len(problems)

        for problem in tqdm(
            problems,
            desc="Finding plans"
        ):
            idx = os.path.basename(problem).split("problem")[1].split(".pddl")[0]
            domain_path = f"{data_dir}/domain.pddl"
            if args.generate_domain:
                domain_path = f"{result_dir}/{args.gen_step}/domains/domain{idx}.pddl"

            found, err = find_plan(
                domain_path,
                problem,
                problem.replace("problems", "plans").replace(".pddl", ""),
                args.downward_dir,
                args.time_limit,
            )

            if not found:
                with open(problem.replace("problems", "errors").replace(".pddl", ".txt"), "w") as fw:
                    fw.write(err)


if __name__ == "__main__":
    main()


