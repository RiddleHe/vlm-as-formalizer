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

def create_pddl(traj_data, problem):
    high_pddl = traj_data["plan"]["high_pddl"]
    objects = {}
    object_types = defaultdict(int)

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
                if object_id in line:
                    simplified_line = line.replace(object_id, objects[object_id]["object_name"])
                    if "Knife" in simplified_line:
                        simplified_line = simplified_line.replace("object", "knife")
                    elif "Microwave" in simplified_line:
                        simplified_line = simplified_line.replace("receptacle", "microwave")
                    elif "Fridge" in simplified_line:
                        simplified_line = simplified_line.replace("receptacle", "fridge")
                    object_states["objects"].append(simplified_line)
                    break
        elif idx < goal_idx: # we are collecting init
            if "(atLocation agent1" in line: # extract agent location
                agent_location = line.split("(")[1].split(")")[0].split(" ")[2]
                idx += 1
                continue
            if any(keyword in line for keyword in ["Type", "was", "distance", "isReceptacleObject"]):
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
                predicate_args = line.split("(")[1].split(")")[0].split(" ")[1:]
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
    idx = goal_idx + 1
    exist_indices = []
    while idx < len(problem):
        line = problem[idx]
        if "(exists" in line:
            exist_indices.append(idx)
        idx += 1
    exist_indices.append(len(problem))

    for i, j in zip(exist_indices[:-1], exist_indices[1:]):
        object_in_question = None
        object_short_name = None
        receptacle_in_question = None
        receptacle_short_name = None
        object_var = None
        receptacle_var = None
        cur_idx = i + 1
        # first pass to get object and receptacle
        while cur_idx < j:
            cur_line = problem[cur_idx].strip()
            if "(objectType" in cur_line or "(receptacleType" in cur_line: # extract object type
                parts = cur_line.split("(")[1].split(")")[0].split(" ")
                object_type = parts[2].strip()
                object_type_raw = object_type.replace("Type", "")
                if object_type_raw in object_by_type:
                    if "(objectType" in cur_line:
                        object_short_name = object_by_type[object_type_raw][0]
                        object_in_question = names_to_ids[object_short_name]
                        object_var = parts[1].strip()
                    # TODO: add support for nested receptacle types
                    elif "(receptacleType" in cur_line:
                        receptacle_short_name = object_by_type[object_type_raw][0]
                        receptacle_in_question = names_to_ids[receptacle_short_name]
                        receptacle_var = parts[1].strip()
                        assert object_in_question is not None, "Object should have been found if receptacle type is found"
                        object_states["goal"].append(f"        (inReceptacle {object_short_name} {receptacle_short_name})")
            cur_idx += 1

        # second pass to get goal
        cur_idx = i + 1
        while cur_idx < j:
            cur_line = problem[cur_idx].strip()
            if "objectAtLocation" in cur_line and cur_idx + 1 < j and "atLocation" in problem[cur_idx + 1]:
                object_states["goal"].append("        (atLocation agent1 " + object_short_name + ")")
                cur_idx += 1
            elif "(" in cur_line and ")" in cur_line: # single predicate
                if "able" in cur_line or "forall" in cur_line or "not" in cur_line or "Type" in cur_line:
                    cur_idx += 1
                    continue  # discard redundant predicates
                condition_args = cur_line.split("(")[1].split(")")[0].split(" ")
                predicate_arg = condition_args[0]           
                arg_list = []
                is_valid_predicate = True
                for arg in condition_args[1:]:
                    if arg == "?a":
                        arg_list.append("agent1")
                    elif arg == object_var:
                        arg_list.append(object_short_name)
                    else: # assume ?l will be filtered and other vars won't occur
                        is_valid_predicate = False
                if is_valid_predicate:
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

def map_to_low_level_action(action_string, objects):
    pass

def process_alfred_dir(input_dir, output_dir):
    domain_path = "/home/mh3897/pddl/villain/scripts/alfred/domain-new.pddl"
    downward_dir = "/home/mh3897/pddl/villain/downward"
    time_limit = 5

    tasks = os.listdir(input_dir)
    tasks.sort()
    total_tasks = len(tasks)
    desired_tasks = 250
    gap = max(1, total_tasks // desired_tasks)
    for i, task in tqdm(enumerate(tasks)):
        if task.startswith("alfred-cleaned"): # dev dir
            continue
        if i % gap == 0:
            try:
                task_dir = os.path.join(input_dir, task)
                task_subdirs = os.listdir(task_dir)
                first_task_subdir = task_subdirs[0]
                first_task_subdir_path = os.path.join(task_dir, first_task_subdir)
                traj_data, problem = find_files_from_alfred_dir(first_task_subdir_path)
                object_states, objects = create_pddl(traj_data, problem)
                pddl_file = assemble_pddl_to_file(object_states)

                output_task_dir = os.path.join(output_dir, task)
                os.makedirs(output_task_dir, exist_ok=True)
                problem_path = os.path.join(output_task_dir, "problem.pddl")
                with open(problem_path, "w") as f:
                    f.write(pddl_file)

                objects_path = os.path.join(output_task_dir, f"objects_{first_task_subdir}.json")
                with open(objects_path, "w") as f:
                    json.dump(objects, f, indent=4)

                plan_path = os.path.join(output_task_dir, "plan.txt")
                command = format_command(domain_path, problem_path, plan_path, downward_dir, time_limit)
                success, err = find_plan(command, plan_path)
                if not success:
                    print(f"Failed to find plan for {task}")
                    shutil.rmtree(output_task_dir)
                    continue
            except Exception as e:
                print(f"Error processing {task}: {e}")


if __name__ == "__main__":
    if sys.argv[1] == "test":
        input_root_dir = "/local-ssd/alfred/full_2.1.0/train/look_at_obj_in_light-AlarmClock-None-DeskLamp-301/"
        input_dir_name = os.listdir(input_root_dir)[0]
        input_dir = os.path.join(input_root_dir, input_dir_name)

        output_dir = f"test-{input_dir.split('/')[-2]}"
        os.makedirs(output_dir, exist_ok=True)

        traj_data, problem = find_files_from_alfred_dir(input_dir)

        object_states, objects = create_pddl(traj_data, problem)
        pddl_file = assemble_pddl_to_file(object_states)

        # for key, value in object_states.items():
        #     print(key)
        #     print(value)
        #     print()

        # print(pddl_file)

        with open(os.path.join(output_dir, "problem.pddl"), "w") as f:
            f.write(pddl_file)

        with open(os.path.join(output_dir, "objects.json"), "w") as f:
            json.dump(objects, f)

        with open(os.path.join(output_dir, "traj_data.json"), "w") as f:
            json.dump(traj_data, f)

    elif sys.argv[1] == "dev":
        input_dir = "/local-ssd/alfred/full_2.1.0/train"
        output_dir = "/local-ssd/alfred/full_2.1.0/train_cleaned"
        os.makedirs(output_dir, exist_ok=True)

        process_alfred_dir(input_dir, output_dir)



    