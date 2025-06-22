import re
from collections import defaultdict, Counter

def parse_actions_from_domain(domain_file):
    regex_patern = r'\(:action\s+(\w+).*?:parameters\s*\((.*?)\)'
    compiled_regex = re.compile(regex_patern, re.DOTALL) 
    matches = compiled_regex.findall(domain_file)
    actions = []
    for match in matches:
        action_name = match[0]
        parameters = re.sub(r'\s+', ' ', match[1].strip())
        actions.append(f"action: {action_name}\nparameters: {parameters}")
    return "\n".join(actions)

def parse_actions_from_plan(plan_file):
    actions = []
    for line in plan_file:
        line = line.strip()[1:-1].split()
        action_name = line[0]
        args = line[1:]
        actions.append({
            "name": action_name,
            "args": args,
        })
    return actions

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

def parse_block(pddl, keyword):
    match = re.search(rf"{re.escape(keyword)}\s+", pddl)

    if match:
        content_start_index = match.end()
        outer_block_start_index = match.start()
        balance = 0
        for i in range(outer_block_start_index, len(pddl)):
            if pddl[i] == '(':
                balance += 1
            elif pddl[i] == ')':
                balance -= 1
            if balance == 0:
                return pddl[content_start_index: i].strip()

    return None

def parse_types(domain_file):
    types = []
    types_block = parse_block(domain_file, "(:types")

    if types_block:
        cleaned_types = re.sub(r";[^\n]*", "", types_block)  # Remove comments
        types_str = cleaned_types.strip()
        if types_str:
            tokens = types_str.split() # Subtypes, supertypes, delimiter -
            idx = 0
            while idx < len(tokens):
                lhs_types = []
                while idx < len(tokens) and tokens[idx] != '-':
                    if tokens[idx].strip():
                        lhs_types.append(tokens[idx].strip())
                    idx += 1
                if idx < len(tokens) and tokens[idx] == '-':
                    idx += 1
                    if idx < len(tokens) and tokens[idx].strip():  # Assume always have rhs
                        supertype = tokens[idx].strip()
                        for sub_type in lhs_types:
                            types.append(f"{sub_type} ({supertype})")
                        idx += 1
                    else:
                        types.extend(lhs_types)
                        if idx < len(tokens):
                            idx += 1
                else:
                    types.extend(lhs_types)

    return types

def parse_predicates(domain_file) -> dict[str, list[str]]:
    predicates_raw = []
    full_predicate_str = parse_block(domain_file, "(:predicates")

    if full_predicate_str:
        cleaned_predicate_str = re.sub(r";[^\n]*", "", full_predicate_str)
        idx = 0
        while idx < len(cleaned_predicate_str):
            start_char = cleaned_predicate_str[idx]
            if start_char == '(':
                balance = 1
                for jdx in range(idx + 1, len(cleaned_predicate_str)):
                    if cleaned_predicate_str[jdx] == '(':
                        balance += 1
                    elif cleaned_predicate_str[jdx] == ')':
                        balance -= 1
                    if balance == 0:
                        signature = cleaned_predicate_str[idx: jdx + 1].strip()
                        signature = re.sub(r"\s+", " ", signature)
                        if signature:
                            predicates_raw.append(signature)
                        idx = jdx
                        break
                if balance != 0:
                    print(f"Unbalanced parentheses in predicate: {cleaned_predicate_str}")
                    break
            idx += 1

    predicates = {}

    predicate_pattern = re.compile(r"\s*\?([\w-]*)\s*-\s*([\w-]*)\s*")
    for predicate_str in predicates_raw:
        content = predicate_str.strip()[1:-1]
        parts = content.split(None, 1)
        name = parts[0]

        args = []
        param_str = parts[1]
        cur_pos = 0
        while cur_pos < len(param_str):
            match = predicate_pattern.match(param_str, cur_pos)
            if match:
                param_name, param_type = match.groups()
                args.append(param_type)
                cur_pos = match.end()
            else:
                break

        if name not in predicates:
            predicates[name] = args

    return predicates

def parse_conditions(pddl_file):
    conditions = []
    blocks = []

    init_conditions_block = parse_block(pddl_file, "(:init")
    if init_conditions_block: 
        blocks.append(init_conditions_block)

    goal_conditions_block = parse_block(pddl_file, "(:goal")
    if goal_conditions_block:
        and_content_start = re.search(r"\(and\s+", goal_conditions_block)
        if and_content_start:
            and_content_start_idx = and_content_start.end()
            goal_conditions_block = goal_conditions_block[and_content_start_idx:]
            blocks.append(goal_conditions_block)
        else:
            blocks.append(goal_conditions_block)

    for block in blocks:
        block = re.sub(r";[^\n]*", "", block)
        idx = 0
        while idx < len(block):
            start_char = block[idx]
            if start_char == '(':
                balance = 1
                for jdx in range(idx + 1, len(block)):
                    if block[jdx] == '(':
                        balance += 1
                    elif block[jdx] == ')':
                        balance -= 1
                    if balance == 0:
                        signature = block[idx + 1: jdx].strip()
                        signature = re.sub(r"\s+", " ", signature)
                        if signature:
                            parts = signature.split()
                            name = parts[0]
                            args = parts[1:]
                            conditions.append({
                                "name": name,
                                "args": args,
                            })
                        idx = jdx
                        break
                if balance != 0:
                    print(f"Unbalanced parentheses in block: {block}")
                    break
            idx += 1

    return conditions

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
                errors["Objects missing '- type' definition"].add(line)
                continue

            if type_name:
                if type_name not in types:
                    errors["Problem object type not defined in domain"].add(type_name)
                    continue

                for obj_name in obj_names:
                    if obj_name in objects:
                        errors["Problem object redefined"].add(f"{obj_name} ({objects[obj_name]} -> {type_name})")
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

        expected_args = predicates[condition_name]

        if len(condition_args) != len(expected_args):
            errors["Predicate expects wrong number of arguments"].add(f"{condition_name} ({len(expected_args)} -> {len(condition_args)})")
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
            # Match generic object type
            if expected_type == "object":
                if object_type in types:
                    continue
            current_type = object_type
            while True:
                if current_type not in type_hierarchy:
                    errors["Predicate argument has wrong type"].add(f"{condition} ({arg_object_name}: {object_type} -> {expected_type})")
                    break
                
                parent = type_hierarchy.get(current_type)
                if parent is None:
                    errors["Predicate argument has wrong type"].add(f"{condition} ({arg_object_name}: {object_type} -> {expected_type})")
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

def compare_plans(gt_plan: list[str], pred_plan: list[str]) -> bool:
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
        return False, "No consistent mapping found between ground truth and predicted plan.\n\n"

    return True, None
