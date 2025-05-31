import random
import os
from tqdm import tqdm

def generate_random_stacks(colors, n_stacks, min_len=2):
    colors_copy = colors.copy()
    random.shuffle(colors_copy)

    if n_stacks == 1:
        return [colors_copy]
    
    stacks = []
    n_excess = len(colors_copy) - (n_stacks * min_len)
    if n_excess < 0:
        raise ValueError(f"Not enough colors to generate stacks with min_len {min_len}")
    
    # a_1, a_2, ..., a_n are sizes of excess in each of n stacks
    # b_1, b_2, ..., b_n are a_i + 1
    val_to_partition = n_stacks + n_excess  # sum of b_i
    cut_points_for_b = random.sample(range(1, val_to_partition), n_stacks - 1)
    cut_points_for_b.sort()

    stack_sizes = []
    last_cutpoint_for_b = 0
    for i in range(n_stacks - 1):
        b_i_excess = cut_points_for_b[i] - last_cutpoint_for_b
        a_i_excess = b_i_excess - 1
        stack_size = min_len + a_i_excess
        stack_sizes.append(stack_size)
        last_cutpoint_for_b = cut_points_for_b[i]

    stack_sizes.append(min_len + (val_to_partition - last_cutpoint_for_b - 1)) # last stack

    current_idx = 0
    for size in stack_sizes:
        stacks.append(colors_copy[current_idx:current_idx + size])
        current_idx += size

    return stacks

def generate_states(stacks, is_goal=False):
    states = []
    for stack in stacks:
        for i, color in enumerate(stack):
            if i == 0:
                if not is_goal:
                    states.append("(ontable " + color + ")")
            else:
                states.append("(on " + color + " " + stack[i-1] + ")")
            if i == len(stack) - 1 and not is_goal:
                states.append("(clear " + color + ")")
    return states

def generate_instruction(stacks):
    instruction = f"Create {len(stacks)} stacks: "
    stacks_str = [" over ".join(stack[::-1]) for stack in stacks]
    instruction += ", ".join(stacks_str)
    return instruction

def generate_pddl(stacks, init_states, goal_states):
    pddl = f"""(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        {"\n        ".join([color + ' - block' for colors in stacks for color in colors])}
        robot - robot
    )
    (:init
        {"\n        ".join(init_states)}
        {"\n        ".join([f"; {" -> ".join(stack)}" for stack in stacks])}
    )
    (:goal (and {"\n        ".join(goal_states)}))
)
    """

    return pddl


colors = ["red", "green", "blue", "purple", "orange", "yellow"]

data_path = "../data/blocksworld-2"
subdirs = ["instructions", "problems", "observations"]

if not os.path.exists(data_path):
    for subdir in subdirs:
        os.makedirs(os.path.join(data_path, subdir), exist_ok=True)

for i in tqdm(range(1, 101)):
    n_stacks = random.randint(1, 3)
    start_stacks = generate_random_stacks(colors, n_stacks)
    end_stacks = generate_random_stacks(colors, n_stacks)
    while start_stacks == end_stacks:
        end_stacks = generate_random_stacks(colors, n_stacks)
    # print(start_stacks)
    # print(end_stacks)

    instruction = generate_instruction(end_stacks)
    # print(instruction)

    init_states = generate_states(start_stacks)
    goal_states = generate_states(end_stacks, is_goal=True)
    # print(init_states)
    # print(goal_states)

    pddl = generate_pddl(start_stacks, init_states, goal_states)
    # print(pddl)

    # print("-" * 10)

    with open(os.path.join(data_path, "instructions", f"problem{i}.txt"), "w") as f:
        f.write(instruction)
    with open(os.path.join(data_path, "problems", f"problem{i}.pddl"), "w") as f:
        f.write(pddl)