import os
import glob
import shutil
from tqdm import tqdm

import sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from utils.checkers import find_plan
from utils.helpers import format_command

def get_image_subset(images, version):
    images = images[4:]
    if version == "June-1":
        images = images[100:]
    elif version == "June-2":
        images = images[1:100]
    elif version == "July":
        pass
    return images

def sample_images(images, n_samples):
    if n_samples >= len(images):
        return images
    step = len(images) / n_samples
    steps = [int(step * i) for i in range(n_samples)]
    return [images[i] for i in steps]

def get_image_digit(image_path):
    try:
        return int(image_path.split("/")[-1].split(".")[0].split("_")[-1])
    except:
        return 100000

def get_instruction(dir_name):
    instruction_root = "/home/mh3897/pddl/villain/data/blocksworld-configs/instructions"

    problem_idx = int(dir_name.split("_")[-1])
    instruction_file = f"problem{problem_idx}.txt"
    assert os.path.exists(os.path.join(instruction_root, instruction_file)), f"Instruction file {instruction_file} does not exist"
    with open(os.path.join(instruction_root, instruction_file), "r") as f:
        instruction = f.read()
    return instruction

def get_pddl(dir_name):
    problem_root = "/home/mh3897/pddl/villain/data/blocksworld-configs/problems"

    problem_idx = int(dir_name.split("_")[-1])
    problem_file = f"problem{problem_idx}.pddl"
    assert os.path.exists(os.path.join(problem_root, problem_file)), f"Problem file {problem_file} does not exist"
    with open(os.path.join(problem_root, problem_file), "r") as f:
        pddl = f.readlines()
    idx_to_insert = -1
    for i, line in enumerate(pddl):
        if "(:init" in line:
            idx_to_insert = i + 1
    pddl.insert(idx_to_insert, "        (handempty robot)")
    pddl = "".join(pddl)
    return pddl

def copy_domain(domain_path, output_path):
    shutil.copy(domain_path, os.path.join(output_path, "domain.pddl"))

def iterate_over_tasks(root_dir, output_dir, version):
    domain_path = "/home/mh3897/pddl/villain/data/blocksworld-real/domain.pddl"
    downward_dir = "/home/mh3897/pddl/villain/downward"
    time_limit = 10

    dir_list = sorted(os.listdir(root_dir))
    for dir_name in tqdm(dir_list):
        if os.path.isdir(os.path.join(root_dir, dir_name)) and "problem" in dir_name:
            path = os.path.join(root_dir, dir_name)

            # Get images
            images = sorted(
                glob.glob(os.path.join(path, "*.jpg")),
                key=get_image_digit
            )
            images = get_image_subset(images, version)
            sampled_images = sample_images(images, 4)
            
            # Get text
            instruction = get_instruction(dir_name)

            # Get pddl
            pddl = get_pddl(dir_name)
            
            # Get output
            output_path = os.path.join(output_dir, dir_name)
            os.makedirs(output_path, exist_ok=True)
            with open(os.path.join(output_path, "instruction.txt"), "w") as f:
                f.write(instruction)
            problem_path = os.path.join(output_path, "problem.pddl")
            with open(problem_path, "w") as f:
                f.write(pddl)
            os.makedirs(os.path.join(output_path, "observations"), exist_ok=True)
            for i, image in enumerate(sampled_images):
                shutil.copy(image, os.path.join(output_path, "observations", image.split("/")[-1]))

            # Find plan
            plan_path = os.path.join(output_path, "plan.txt")
            command = format_command(domain_path, problem_path, plan_path, downward_dir, time_limit)
            success, err = find_plan(command, plan_path)
            if not success:
                print(f"Failed to find plan for {dir_name}, removing task...")
                shutil.rmtree(output_path)

def get_stats(output_dir):
    total_tasks = 0
    total_observations = 0
    max_observations = 0
    total_steps = 0
    max_steps = 0

    for dir_name in tqdm(os.listdir(output_dir)):
        if os.path.isdir(os.path.join(output_dir, dir_name)):
            total_tasks += 1
            observations = os.listdir(os.path.join(output_dir, dir_name, "observations"))
            total_observations += len(observations)
            max_observations = max(max_observations, len(observations))
            with open(os.path.join(output_dir, dir_name, "plan.txt"), "r") as f:
                steps = len(f.readlines())
            total_steps += steps
            max_steps = max(max_steps, steps)
    print(f"Output directory: {output_dir}")
    print(f"Total tasks: {total_tasks}")
    print(f"Total observations: {total_observations}")
    print(f"Max observations: {max_observations}")
    print(f"Average observations: {total_observations // total_tasks}")
    print(f"Total steps: {total_steps}")
    print(f"Max steps: {max_steps}")
    print(f"Average steps: {total_steps // total_tasks}")

if __name__ == "__main__":
    output_dir = "/local-ssd/alfred/blocksworld-real"
    # os.makedirs(output_dir, exist_ok=True)

    # iterate_over_tasks("/local-ssd/alfred/problem_1_3", output_dir, "June-1")
    # iterate_over_tasks("/local-ssd/alfred/problem_4_30", output_dir, "June-2")
    # iterate_over_tasks("/local-ssd/alfred/problem_31_102", output_dir, "July")

    # for dir_name in tqdm(os.listdir(output_dir)):
    #     if os.path.isdir(os.path.join(output_dir, dir_name)):
    #         copy_domain(
    #             domain_path="/home/mh3897/pddl/villain/data/blocksworld-real/domain.pddl", 
    #             output_path=os.path.join(output_dir, dir_name)
    #         )

    output_dir_alfred = "/local-ssd/alfred/alfred_train_cleaned"
    # for dir_name in tqdm(os.listdir(output_dir_alfred)):
    #     if os.path.isdir(os.path.join(output_dir_alfred, dir_name)):
    #         copy_domain(
    #             domain_path="/home/mh3897/pddl/villain/scripts/data/domain-alfred.pddl", 
    #             output_path=os.path.join(output_dir_alfred, dir_name)
    #         )

    get_stats(output_dir)
    get_stats(output_dir_alfred)





