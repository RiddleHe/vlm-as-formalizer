import os
import json
from collections import defaultdict
import sys
from tqdm import tqdm
import shutil

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from utils.checkers import find_plan
from utils.helpers import format_command

def convert_coord_to_loc(coords):
    translated_object_coords = [str(coord).replace("-", "_minus_").replace(".", "_dot_") for coord in coords]
    object_coords_str = "_comma_".join(translated_object_coords)
    return object_coords_str

def convert_loc_bar_to_loc_num(loc):
    return loc.replace("_bar_", "|").replace("_minus_", "-").replace("_dot_", ".")

def find_paren_end_idx(lines, start_idx):
    paren_count = 0
    for i in range(len(lines)): # start from the opening paren
        line = lines[i].strip()
        for char in line:
            if char == "(":
                paren_count += 1
            elif char == ")":
                paren_count -= 1
                if paren_count == 0:
                    return start_idx + i # return the index of the closing parenthesis
    raise ValueError("No closing parenthesis found")

def create_pddl(traj_data, problem):
    high_pddl = traj_data["plan"]["high_pddl"]
    objects = {}
    object_types = defaultdict(int)

    filter_keywords = [
        "able", 
    ]

    pred_sub_list = {
        "inReceptacleObject": "inReceptacle"
    }

    predicate_list = [
        "opened", "inReceptacle", "holds", "holdsAny",
        "isClean", "isHot", "isCool", 
        "isOn", "isToggled", "isSliced", "atLocation"
    ]

    # Extract relevant objects with locations, discard objectId 
    for action in high_pddl:
        planner_action = action["planner_action"]

        coordinateObjectId = planner_action.get("coordinateObjectId", None)
        coordinateReceptacleObjectId = planner_action.get("coordinateReceptacleObjectId", None)
        action_object_id = planner_action.get("objectId", None) # this id is used in action to control env simulator
        action_receptacle_object_id = planner_action.get("receptacleObjectId", None)
        for object_info, object_place in [(coordinateObjectId, "object"), (coordinateReceptacleObjectId, "receptacle")]:
            if object_info:
                object_type, object_coords = object_info
                object_id = object_type + "_" + convert_coord_to_loc(object_coords) # this id is used in PDDL
                object_env_id = None
                if action_object_id and object_place == "object":
                    action_object_type = action_object_id.split("|")[0]
                    if action_object_type == object_type:  # match object type
                        object_env_id = action_object_id
                if action_receptacle_object_id and object_place == "receptacle":
                    action_receptacle_type = action_receptacle_object_id.split("|")[0]
                    if action_receptacle_type == object_type:
                        object_env_id = action_receptacle_object_id
                if object_id not in objects:
                    object_types[object_type] += 1
                    objects[object_id] = {
                        "object_type": object_type,
                        "coords": object_coords,
                        "is_receptacle": object_place == "receptacle",
                        "object_name": object_type + "_" + str(object_types[object_type]),
                        "object_env_id": object_env_id,
                    }

    names_to_ids = {v["object_name"]: k for k, v in objects.items()}
    object_by_type = defaultdict(list)
    for name, object_id in names_to_ids.items():
        obj_type = objects[object_id]["object_type"]
        object_by_type[obj_type].append(name)

    # for object_id, object_info in objects.items():
    #     print(object_id, object_info)
    #     print("\n")

    # Get all relevant object states from problem pddl
    object_states = {
        "objects": [],
        "init": [],
        "goal": [],
    }
    object_idx = -1
    init_idx = -1
    goal_idx = -1
    agent_location = None
    for i, line in enumerate(problem):
        if "(:objects" in line:
            object_idx = i
        elif "(:init" in line:
            init_idx = i
        elif "(:goal" in line:
            goal_idx = i
            break

    # Filter pddl file for object, init, and goal
    idx = object_idx + 1
    while idx < len(problem):
        line = problem[idx]
        has_target_object = False
        if idx < init_idx: # we are collecting objects
            if "agent1" in line:
                object_states["objects"].append(line)
                idx += 1
                continue
            for object_id in objects.keys(): 
                if object_id in line: # object_id - object_type
                    parts = line.strip().split(" ")
                    assert object_id == parts[0].strip(), f"Object id {object_id} does not match {parts[0].strip()}"
                    object_general_type = parts[2].strip() # object vs receptacle
                    object_type = objects[object_id]["object_type"]
                    simplified_line = line.replace(object_id, objects[object_id]["object_name"])
                    if object_type == "Knife" or object_type == "ButterKnife":
                        simplified_line = simplified_line.replace(object_general_type, "knife")
                    elif object_type == "Microwave":
                        simplified_line = simplified_line.replace(object_general_type, "microwave")
                    elif object_type == "Fridge":
                        simplified_line = simplified_line.replace(object_general_type, "fridge")
                    elif object_type == "SinkBasin":
                        simplified_line = simplified_line.replace(object_general_type, "sink")
                    elif object_general_type == "object" and objects[object_id]["is_receptacle"]:
                        simplified_line = simplified_line.replace(object_general_type, "receptacle")
                    object_states["objects"].append(simplified_line)
                    break
        elif idx < goal_idx: # we are collecting init
            if "(atLocation agent1" in line: # extract agent location
                agent_location = line.split("(")[1].split(")")[0].split(" ")[2]
                idx += 1
                continue
            if "AtLocation" in line: # document object location
                stripped_line = line.split("(")[1].split(")")[0]
                predicate, object_id, location = stripped_line.split(" ")
                if object_id in objects:
                    objects[object_id]["location"] = convert_loc_bar_to_loc_num(location)  # 4 coords: x, z, rotation, horizon
                    if agent_location and location == agent_location:
                        location_line = f"        (atLocation agent1 {objects[object_id]['object_name']})"
                        object_states["init"].append(location_line)
                idx += 1
                continue
            if "(" in line and ")" in line: 
                parts = line.split("(")[1].split(")")[0].split(" ")
                predicate_name = parts[0]
                if predicate_name not in predicate_list:
                    idx += 1
                    continue
                predicate_args = parts[1:]
                n_pred_args = len(predicate_args)
                n_processed_args = 0
                for object_id in objects.keys():
                    if object_id in line:
                        has_target_object = True
                        line = line.replace(object_id, objects[object_id]["object_name"])
                        n_processed_args += 1
                if has_target_object and n_processed_args == n_pred_args:
                    object_states["init"].append(line)
        idx += 1 # we do not collect goal

    # We collect goals separately
    idx = goal_idx
    exist_block_indices = [] # tuples of (start, end + 1)
    while idx < len(problem):
        line = problem[idx]
        if "(exists" in line:
            end_idx = find_paren_end_idx(problem[idx:], idx)
            exist_block_indices.append((idx, end_idx + 1))
            idx = end_idx - 1 # stay on end_idx in case new exist block starts
        idx += 1

    for i, j in exist_block_indices:
        variables = {}
        cur_idx = i
        # first pass to get all variable through type declaration
        while cur_idx < j:
            cur_line = problem[cur_idx].strip()
            if "(objectType" in cur_line or "(receptacleType" in cur_line: # eg. (receptacleType ?r CounterTopType)
                parts = cur_line.split("(")[1].split(")")[0].split(" ")
                variable_type = "receptacle" if parts[0] == "receptacleType" else "object"
                object_type_prefix = parts[2].strip()
                object_type_prefix = object_type_prefix.replace("Type", "")
                assert object_type_prefix in object_by_type.keys(), f"Object {object_type_prefix} not found in existing object types"
                object_name = object_by_type[object_type_prefix][0]  # Assume that we can use any object of this type, eg. CounterTop_1
                object_id = names_to_ids[object_name]
                object_var = parts[1].strip() # TODO: make sure to handle inReceptacle
                variables[object_var] = {
                    "object_id": object_id,
                    "object_type": object_type_prefix,
                    "object_name": object_name,
                    "variable_type": variable_type,
                }
            cur_idx += 1

        cur_idx = i # reset for predicate parsing
        while cur_idx < j:
            cur_line = problem[cur_idx].strip()
            if "objectAtLocation" in cur_line and cur_idx + 1 < j and "atLocation" in problem[cur_idx + 1]: # TODO: more robust location parsing
                cur_var = cur_line.split("(")[1].split(")")[0].split(" ")[1]  # the object at location
                cur_object_name = variables[cur_var]["object_name"]
                object_states["goal"].append("        (atLocation agent1 " + cur_object_name + ")")
                cur_idx += 1
            elif "(" in cur_line and ")" in cur_line: # filter logical connectives eg. (and, (or
                condition_args = cur_line.split("(")[1].split(")")[0].split(" ")
                predicate_arg = condition_args[0]
                predicate_arg = pred_sub_list.get(predicate_arg, predicate_arg)  
                if predicate_arg not in predicate_list:
                    cur_idx += 1
                    continue
                if any(keyword in cur_line for keyword in filter_keywords):  # filter -able predicates
                    cur_idx += 1
                    continue  # discard redundant predicates
                arg_list = []
                for arg in condition_args[1:]:
                    if arg == "?a":
                        arg_list.append("agent1")
                    elif arg in variables.keys():
                        arg_list.append(variables[arg]["object_name"])
                    else: # assume ?l will be filtered and other vars won't occur
                        raise ValueError(f"Invalid predicate argument in {cur_line}: {arg}")
                arg_str = " ".join(arg_list)
                object_states["goal"].append(f"        ({predicate_arg} {arg_str})")
            # we skip (and and we skip )
            cur_idx += 1

    # for object_id, object_info in objects.items():
    #     print(object_id)
    #     print(object_info)
    #     print()

    return object_states, objects

def assemble_pddl_to_file(object_states):
    pddl_lines = []
    pddl_lines.append("(define (problem alfred_problem)\n")
    pddl_lines.append("    (:domain put_task)\n")
    pddl_lines.append("    (:objects\n")
    for object_state in object_states["objects"]:
        pddl_lines.append(object_state)
    pddl_lines.append("        )\n")
    pddl_lines.append("    (:init\n")
    for init_state in object_states["init"]:
        pddl_lines.append(init_state)
    pddl_lines.append("    )\n")
    pddl_lines.append("    (:goal (and\n")
    for goal_state in object_states["goal"]:
        pddl_lines.append(goal_state + "\n")
    pddl_lines.append("    ))\n")
    pddl_lines.append(")")
    pddl_file = "".join(pddl_lines)
    return pddl_file

def find_files_from_alfred_dir(input_dir):
    traj_data_path = os.path.join(input_dir, "traj_data.json")
    problem_path = os.path.join(input_dir, "problem_0.pddl")

    with open(traj_data_path, "r") as f:
        traj_data = json.load(f)

    with open(problem_path, "r") as f:
        problem = f.readlines()

    return traj_data, problem

def process_alfred_dir(input_dir, output_dir):
    domain_path = "/pddl/villain/scripts/alfred/domain-alfred.pddl"
    downward_dir = "/pddl/villain/downward"
    time_limit = 5

    tasks = os.listdir(input_dir)
    tasks.sort()
    total_tasks = len(tasks)
    desired_tasks = 1023
    gap = max(1, total_tasks // desired_tasks)
    for i, task in tqdm(enumerate(tasks)):
        if task.startswith("alfred-cleaned"): # dev dir
            continue
        if i % gap == 0:
            try:
                task_dir = os.path.join(input_dir, task)
                task_subdirs = sorted(os.listdir(task_dir))
                first_task_subdir = task_subdirs[0]
                first_task_subdir_path = os.path.join(task_dir, first_task_subdir)
                output_task_dir = os.path.join(output_dir, task + "_" + first_task_subdir)
                os.makedirs(output_task_dir, exist_ok=True)

                problem_path = process_alfred_example(first_task_subdir_path, output_task_dir)

                plan_path = os.path.join(output_task_dir, "plan.txt")
                command = format_command(domain_path, problem_path, plan_path, downward_dir, time_limit)
                success, err = find_plan(command, plan_path)
                if not success:
                    print(f"Failed to find plan for {task}, removing task...")
                    shutil.rmtree(output_task_dir)
            except Exception as e:
                print(f"Error processing {task}: {e}")

def process_alfred_example(input_dir, output_dir):
    traj_data, problem = find_files_from_alfred_dir(input_dir)

    instruction = traj_data["turk_annotations"]["anns"][0]["task_desc"].strip()

    object_states, objects = create_pddl(traj_data, problem)
    pddl_file = assemble_pddl_to_file(object_states)

    problem_path = os.path.join(output_dir, "problem.pddl")

    with open(problem_path, "w") as f:
        f.write(pddl_file)
    with open(os.path.join(output_dir, "objects.json"), "w") as f:
        json.dump(objects, f, indent=4)
    with open(os.path.join(output_dir, "traj_data.json"), "w") as f:
        json.dump(traj_data, f, indent=4)
    with open(os.path.join(output_dir, "problem-orig.pddl"), "w") as f:
        for line in problem:
            f.write(line)
    with open(os.path.join(output_dir, "instruction.txt"), "w") as f:
        f.write(instruction)

    return problem_path

if __name__ == "__main__":
    if sys.argv[1] == "test":
        # input_root_dir = "/local-ssd/alfred/full_2.1.0/train/look_at_obj_in_light-AlarmClock-None-DeskLamp-314"
        input_root_dir = "/local-ssd/alfred/full_2.1.0/train/pick_and_place_with_movable_recep-Apple-Pot-Fridge-26"
        input_dir_name = sorted(os.listdir(input_root_dir))[0]
        input_dir = os.path.join(input_root_dir, input_dir_name)

        output_dir = f"test-{input_dir.split('/')[-2]}"
        os.makedirs(output_dir, exist_ok=True)

        process_alfred_example(input_dir, output_dir)

    elif sys.argv[1] == "dev":
        input_dir = "/local-ssd/alfred/full_2.1.0/train"
        output_dir = "/local-ssd/alfred/alfred_train_cleaned/"
        os.makedirs(output_dir, exist_ok=True)

        process_alfred_dir(input_dir, output_dir)



    