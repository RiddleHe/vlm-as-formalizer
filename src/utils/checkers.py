from collections import defaultdict, Counter
import re
import subprocess
import os
import glob
import tempfile

from .parse_response import parse_types, parse_predicates, parse_conditions, parse_block, parse_actions_from_plan
from .helpers import create_file_paths, format_command

def check_pddl(pddl_file: str, domain_file: str) -> tuple[bool, str]:
    errors = defaultdict(set)

    # From domain: Extract all object types
    types_raw = parse_types(domain_file)
    type_hierarchy = {}
    types = set()
    
    type_pattern = re.compile(r"([^\s(]+)\s*\((.*?)\)") # type (supertype)
    for type_entry in types_raw:
        match = type_pattern.match(type_entry)
        if match:
            subtype, supertype = match.groups()
            type_hierarchy[subtype] = supertype
            types.add(subtype)
            types.add(supertype)
        else:  # basic type
            type_hierarchy[type_entry] = None
            types.add(type_entry)

    for parent_type in list(type_hierarchy.values()):
        if parent_type and parent_type not in type_hierarchy:
            type_hierarchy[parent_type] = None

    # From problem: Map all objects to their types, check for missing types
    objects = {}
    objects_block = parse_block(pddl_file, "(:objects")

    if objects_block:
        cleaned_objects_block = re.sub(r";[^\n]*", "", objects_block)
        object_lines = cleaned_objects_block.strip().split("\n")

        for line in object_lines:
            line = line.strip()
            if not line: continue

            parts = line.strip().split()
            type_name = None
            obj_names = []

            if '-' in parts:
                dash_index = parts.index('-')
                obj_names = parts[:dash_index]
                if dash_index + 1 < len(parts):
                    type_name = parts[dash_index + 1]

            else:
                errors["Objects missing '- type' definition. Every line should be of the form 'object1 - type'"].add(line)
                continue

            if type_name:
                if type_name not in types:
                    errors["Problem object type not defined in domain"].add(type_name)
                    continue

                for obj_name in obj_names:
                    if obj_name in objects:
                        errors["Problem object redefined"].add(f"{obj_name} was {objects[obj_name]} but is now {type_name}")
                    else:
                        objects[obj_name] = type_name

    # From domain: Extract all predicates
    predicates = parse_predicates(domain_file)

    # From problem: Extract all predicates in init and goal
    conditions = parse_conditions(pddl_file)

    # From problem: Check if predicate args have the correct types
    for condition in conditions:
        condition_name = condition["name"]
        condition_args = condition["args"]

        if condition_name not in predicates:
            errors["Predicate not defined in domain"].add(condition_name)
            continue

        expected_args = predicates[condition_name]["args"]

        if len(condition_args) != len(expected_args):
            errors["Predicate expects wrong number of arguments"].add(f"{condition_name} {' '.join(condition_args)}: should have {len(expected_args)} arguments")
            continue

        for i, arg_object_name in enumerate(condition_args):
            object_type = objects.get(arg_object_name)
            if object_type is None:
                errors["Object does not have a type"].add(f"{arg_object_name}")
                continue

            expected_type = expected_args[i]
            # Exact match
            if object_type == expected_type:
                continue
            # # Match generic object type
            # if expected_type == "object":
            #     if object_type in types:
            #         continue
            current_type = object_type
            while True:
                if current_type not in type_hierarchy:
                    errors["Predicate argument has wrong type"].add(f"{condition['name']} {' '.join(condition['args'])}: {arg_object_name} is not a {expected_type}")
                    break
                
                parent = type_hierarchy.get(current_type)
                if parent is None:
                    errors["Predicate argument has wrong type"].add(f"{condition['name']} {' '.join(condition['args'])}: {arg_object_name} is not a {expected_type}")
                    break
                
                current_type = parent
                if current_type == expected_type:
                    break
                
    if not errors:
        return True, None
    
    else:
        error_msg = ""
        for error_type, error_list in errors.items():
            error_msg += f"{error_type}:\n"
            for error in error_list: 
                error_msg += f"  {error}\n"
            error_msg += "\n"

        return False, error_msg

def find_mapping_recursive(gt_actions, pred_actions, mapping):
    if not gt_actions:  # all gt_actions have been mapped
        return mapping 

    current_gt_action = gt_actions[0]
    remaining_gt_actions = gt_actions[1:]

    for i, current_pred_action in enumerate(pred_actions):
        if current_gt_action["name"] == current_pred_action["name"]:
            temp_mapping = mapping.copy()
            is_consistent = True

            for gt_arg, pred_arg in zip(current_gt_action["args"], current_pred_action["args"]):
                if gt_arg in temp_mapping:
                    if temp_mapping[gt_arg] != pred_arg:  # gt_arg mapped to a different pred_arg
                        is_consistent = False
                        break
                elif pred_arg in temp_mapping.values():  # pred_arg mapped to a different gt_arg
                    is_consistent = False
                    break 
                else:
                    temp_mapping[gt_arg] = pred_arg

            if is_consistent: # mapping is consistent up to current pair, continue without backtracking
                remaining_pred_actions = pred_actions[:i] + pred_actions[i+1:]
                solution = find_mapping_recursive(remaining_gt_actions, remaining_pred_actions, temp_mapping)
                if solution:
                    return solution

    return {}  # no consistent mapping found, backtrack

def compare_plans(gt_plan: list[str], pred_plan: list[str], domain: str) -> bool:
    msg = ""
    success = True

    gt_actions = parse_actions_from_plan(gt_plan)
    pred_actions = parse_actions_from_plan(pred_plan)

    if not len(gt_actions) == len(pred_actions):
        return False, f"Plan length mismatch.\nGround truth has {len(gt_actions)} steps.\nPredicted has {len(pred_actions)} steps.\n\n"

    gt_actions_counts = Counter(action["name"] for action in gt_actions)
    pred_actions_counts = Counter(action["name"] for action in pred_actions)

    if not gt_actions_counts == pred_actions_counts:
        return False, f"Plan action counts mismatch.\nGround truth has {gt_actions_counts}.\nPredicted has {pred_actions_counts}.\n\n"

    mapping = find_mapping_recursive(gt_actions, pred_actions, {})
    if not mapping:
        if domain != "alfred":
            return False, "No consistent mapping found between ground truth and predicted plans."
        else:
            print(f"Checking mapping for special cases...")
            first_action_pred = pred_actions[0]
            first_action_gt = gt_actions[0]
            second_action_pred = pred_actions[1]
            second_action_gt = gt_actions[1]
            if first_action_pred["name"] == first_action_gt["name"] == "gotolocation" and \
                second_action_pred["name"] == second_action_gt["name"] and \
                first_action_pred["args"][1] == second_action_pred["args"][1]: # same action sequences
                print(f"Special case matched!")
                return True, None
            else:
                return False, "No consistent mapping found between ground truth and predicted plans."
    
    return True, None

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
            elif "Driver aborting after search" in msg:
                msg = "Search stopped early due to time limit"
            else:
                msg = "..." + msg[-500:]

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
            for fname in plan_files:
                os.remove(fname)

            with open(f"{plan_path}", "w") as fw:
                fw.write(best_plan)

            return True, None

        return False, "No plan found"

    except Exception as e:
        return False, e.output.decode().strip()