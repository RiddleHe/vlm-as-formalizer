#!/usr/bin/env python

import os
import json
import random
import base64
import re
from tqdm import tqdm
import time
import traceback
import subprocess
import glob
from PIL import Image
from utils import seed_everything, parse_args, PDDL, get_error_meaning

# python vlm_main.py --data_dir "../data/cooking" --result_dir "../results/20250417_2/cooking" --generate_problem --prompt_type df --num_examples 1
# python vlm_main.py --data_dir "../data/cooking" --result_dir "../results/20250417_2/cooking" --find_plan

from dotenv import load_dotenv
load_dotenv('.env')
from openai import OpenAI
client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY"),
)

def run_model(prompt, observation, client_name="gpt-4o-mini"):
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
    You must output the PDDL file in the correct format directly without explanation.

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
    PDDL problem:
    """
    
    return prompt

def build_df_prompt(examples, target, domain_name):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL domain file to guide the robot to perform the task.
    The domain file contains object types, predicates, and actions.
    You must output the domain file in the correct format directly without explanation.

    Examples of PDDL domain files given a different domain instruction:
    """

    for example in examples:
        prompt += f"""
        Instruction: {example["instruction"]}
        Domain file: {example["domain"]}
        """

    prompt += f"""
    For the current domain, {domain_name}, this is the requirements:
    """

    prompt += f"""
    Instruction: {target["instruction"]}
    Domain file:
    """

    return prompt

def generate_problem(target, examples, domain_name, mode="pf"):
    observation = target["observation"]
    # Generate PDDL objects
    if mode == "df":
        df_prompt = build_df_prompt(examples, target, domain_name)
        # print(f"DF prompt: {df_prompt}\n\n")
        response = run_model(df_prompt, observation)

        df_regex_pattern = r'(\(define.*\))'  # Greedily capture everything until closing parenthesis
        df_pddl_match = re.search(df_regex_pattern, response, re.DOTALL)
        if df_pddl_match:
            df_pddl_file = df_pddl_match.group(1).strip()
        else:
            print(f"Response: {response}\n\n")
            raise ValueError("No PDDL file found in the response")

        # print(f"Domain file: {df_pddl_file}\n\n")

        target["domain"] = df_pddl_file

    pf_prompt = build_pf_prompt(examples, target, domain_name)
    # print(f"PF prompt: {pf_prompt}\n\n")
    response = run_model(pf_prompt, observation)

    # Match the PDDL file in the response by header and footer
    pf_regex_pattern = r'(\(define.*\))' # Same as df regex
    pddl_match = re.search(pf_regex_pattern, response, re.DOTALL)
    if pddl_match:
        pddl_file = pddl_match.group(1).strip()
    else:
        print(f"Response: {response}\n\n")
        raise ValueError("No PDDL file found in the response")

    # print(f"PDDL file: {pddl_file}\n\n")

    pddl = PDDL(pddl_file)
    objects = pddl.pddl_objects
    initial_state = pddl.pddl_initial_state
    goal_specification = pddl.pddl_goal_specification

    # print(f"Objects: {objects}")
    # print(f"Initial state: {initial_state}")
    # print(f"Goal specification: {goal_specification}")

    # import sys; sys.exit()
    # time.sleep(10)

    return objects, initial_state, goal_specification, response

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
    domain_name = args.data_dir.split("/")[-1]

    seed_everything(args.seed)

    task_names = [
        fname.rsplit(".", 1)[0]
        for fname in os.listdir(f"{args.data_dir}/problems")
    ]  # problem1.pddl, problem2.pddl, ...

    domain_file = open(f"{args.data_dir}/domain.pddl").read()

    folders = ["objects", "initial_states", "goal_specifications", "problems", "responses"]
    if args.prompt_type == "df":
        folders.append("domains")

    # generate PDDL problems
    if args.generate_problem:
        for dname in folders:
            os.makedirs(
                f"{args.result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        examples = []
        all_targets = []

        # Set up example domain
        domains = ["cooking", "hanoi", "blocksworld"]
        domains.remove(domain_name) # choose another domain as example
        example_domain_name = random.choice(domains)
        example_domain_dir = args.data_dir.replace(domain_name, example_domain_name)

        for idx in range(args.num_examples):
            example_problem_filepath = f"{example_domain_dir}/problems/problem{idx+1}.pddl"
            example_instruction_filepath = f"{example_domain_dir}/instructions/problem{idx+1}.txt"
            example_problem_file = open(example_problem_filepath).read()
            example_domain = open(f"{example_domain_dir}/domain.pddl").read()
            example_instruction = open(example_instruction_filepath).read()

            example_problem = PDDL(example_problem_file)
            examples += [{
                "problem": example_problem.pddl_problem,
                "objects": example_problem.pddl_objects,
                "initial_state": example_problem.pddl_initial_state,
                "goal_specification": example_problem.pddl_goal_specification,
                "instruction": example_instruction,
                "domain": example_domain,
            }]
            

        num_tasks = len(os.listdir(f"{args.data_dir}/problems"))
        for task_idx in range(1, num_tasks+1):
            with open(f"{args.data_dir}/problems/problem{task_idx}.pddl", "r") as f:
                pddl_file = f.read()
            pddl = PDDL(pddl_file)  # ground truth PDDL problem
            instruction = open(f"{args.data_dir}/instructions/problem{task_idx}.txt").read()  # instruction for VLM
            observation = f"{args.data_dir}/observations/problem{task_idx}.jpg"  # image path of the scene

            all_targets += [{
                "problem": None,
                "objects": None,
                "initial_state": None,
                "goal_specification": None,
                "response": None,
                "observation": observation,
                "instruction": instruction,
                "domain": domain_file,
            }]

        gen_idx = 1
        for task_name_idx in tqdm(
            range(len(task_names)), 
            total=len(task_names), 
            desc="Generating PDDL problems"
        ):
            target = all_targets[task_name_idx]

            # generate PDDL objects, initial state, and goal specification
            objects, initial_state, goal_specification, response = generate_problem(
                target,
                examples,
                domain_name=domain_name,
                mode=args.prompt_type,
            )

            target["objects"] = objects
            target["initial_state"] = initial_state
            target["goal_specification"] = goal_specification
            target["response"] = response
            # save PDDL objects
            try:
                with open(f"{args.result_dir}/{args.gen_step}/objects/problem{gen_idx}.pddl", "w") as fw:
                    fw.write(objects)

                with open(f"{args.result_dir}/{args.gen_step}/initial_states/problem{gen_idx}.pddl", "w") as fw:
                    fw.write(initial_state)

                with open(f"{args.result_dir}/{args.gen_step}/goal_specifications/problem{gen_idx}.pddl", "w") as fw:
                    fw.write(goal_specification)

                if args.prompt_type == "df":
                    with open(f"{args.result_dir}/{args.gen_step}/domains/domain{gen_idx}.pddl", "w") as fw:
                        fw.write(target["domain"])
            
            except Exception as e:
                print(f"Error saving PDDL: {traceback.format_exc()}")
                print(f"Objects: {objects}")
                print(f"Initial state: {initial_state}")
                print(f"Goal specification: {goal_specification}")

            with open(f"{args.result_dir}/{args.gen_step}/responses/problem{gen_idx}.txt", "w") as fw:
                    fw.write(response)

            # concat all parts and generate problem
            problem = f"(define (problem {domain_name}) \n" + \
                        f"(:domain {domain_name}) \n" + \
                        f"{objects} \n" + \
                        f"{initial_state} \n" + \
                        f"{goal_specification} \n" + \
                        f")"

            with open(f"{args.result_dir}/{args.gen_step}/problems/problem{gen_idx}.pddl", "w") as fw:
                fw.write(problem)

            gen_idx += 1

    # refine generated problems using corrective reprompting
    elif args.refine_problem:
        os.makedirs(
            f"{args.result_dir}/{args.gen_step}/problems",
            exist_ok=True,
        )

        all_examples = []
        all_targets = []

        num_tasks = len(os.listdir(f"{args.data_dir}/problems"))
        for task_idx in range(1, num_tasks+1):
            pddl = PDDL(open(f"{args.data_dir}/problems/problem{task_idx}.pddl").read())
            instruction = open(f"{args.data_dir}/instructions/problem{task_idx}.txt").read()

            annotated_bbox_anns = json.load(open(f"{args.result_dir}/annotated_bboxes/problem{task_idx}.json"))

            all_examples += [{
                "problem": pddl.pddl_problem,
                "bboxes": annotated_bbox_anns,
                "instruction": instruction,
            }]

        num_problems = len(os.listdir(f"{args.result_dir}/{args.prev_gen_step}/problems"))
        for gen_idx in range(1, num_problems+1):
            task_idx = (gen_idx - 1) // args.num_repeat + 1

            pddl = PDDL(open(f"{args.result_dir}/{args.prev_gen_step}/problems/problem{gen_idx}.pddl").read())

            target = {
                "problem": pddl.pddl_problem,
                "bboxes": json.load(open(f"{args.result_dir}/predicted_bboxes/problem{task_idx}.json")),
                "instruction": open(f"{args.data_dir}/instructions/problem{task_idx}.txt").read(),
            }

            all_example_indices = list(range(num_tasks))
            del all_example_indices[task_idx-1] # remove the current task from examples

            random.Random(gen_idx).shuffle(all_example_indices)
            example_indices = all_example_indices[:args.num_examples]

            examples = [
                all_examples[i]
                for i in example_indices
            ]

            error_path = f"{args.result_dir}/{args.prev_gen_step}/errors/problem{gen_idx}.txt"

            if os.path.exists(error_path) or args.refine_all:
                if os.path.exists(error_path):
                    error_name, error_meaning = get_error_meaning(error_path)
                    error = (error_name, error_meaning)
                else:
                    error = None

                refined_problem = vilain.refine_problem(
                    target,
                    error,
                    examples,
                )
            else:
                refined_problem = target["problem"]

            with open(f"{args.result_dir}/{args.gen_step}/problems/problem{gen_idx}.pddl", "w") as fw:
                fw.write(refined_problem)

    # find plan using fast-downward
    if args.find_plan:
        for dname in ("plans", "errors"):
            os.makedirs(
                f"{args.result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        num_problems = len(os.listdir(f"{args.result_dir}/{args.gen_step}/problems"))

        for gen_idx in tqdm(
            range(1, num_problems+1),
            total=num_problems,
            desc="Finding plans"
        ):
            if "domains" in os.listdir(f"{args.result_dir}/{args.gen_step}"):
                domain_path = f"{args.result_dir}/{args.gen_step}/domains/domain{gen_idx}.pddl"
            else:
                domain_path = f"{args.data_dir}/domain.pddl"

            found, err = find_plan(
                domain_path,
                f"{args.result_dir}/{args.gen_step}/problems/problem{gen_idx}.pddl",
                f"{args.result_dir}/{args.gen_step}/plans/problem{gen_idx}",
                args.downward_dir,
                args.time_limit,
            )

            if not found:
                with open(f"{args.result_dir}/{args.gen_step}/errors/problem{gen_idx}.txt", "w") as fw:
                    fw.write(err)


if __name__ == "__main__":
    main()


