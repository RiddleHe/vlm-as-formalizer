import re
from collections import defaultdict

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

def parse_block(pddl, keyword, save_header=False):
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
                if save_header:
                    return pddl[outer_block_start_index: i+1].strip()
                else:
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

def parse_predicates(domain_file) -> dict[str, dict]:
    predicates_raw = []
    comments = []
    full_predicate_str = parse_block(domain_file, "(:predicates")

    if full_predicate_str:
        idx = 0
        while idx < len(full_predicate_str):
            start_char = full_predicate_str[idx]
            if start_char == '(':
                balance = 1
                for jdx in range(idx + 1, len(full_predicate_str)):
                    if full_predicate_str[jdx] == '(':
                        balance += 1
                    elif full_predicate_str[jdx] == ')':
                        balance -= 1
                    if balance == 0:
                        signature = full_predicate_str[idx: jdx + 1].strip()
                        signature = re.sub(r"\s+", " ", signature)
                        if signature:
                            predicates_raw.append(signature)

                        next_paren_idx = full_predicate_str.find('(', jdx + 1)
                        if next_paren_idx == -1:
                            next_paren_idx = len(full_predicate_str)

                        comment_part = full_predicate_str[jdx + 1: next_paren_idx]
                        comment_match = re.search(r";([^\n]*)", comment_part)
                        if comment_match:
                            comments.append(comment_match.group(1).strip())
                        else:
                            comments.append("")

                        idx = jdx
                        break
                if balance != 0:
                    print(f"Unbalanced parentheses in predicate: {full_predicate_str}")
                    break
            idx += 1

    predicates = defaultdict(dict)

    predicate_pattern = re.compile(r"\s*\?([\w-]*)\s*-\s*([\w-]*)\s*")
    for predicate_str, comment in zip(predicates_raw, comments):
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

        predicates[name] = {
            "args": args,
            "comment": comment,
        }

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
                        if signature:
                            parts = signature.split()
                            name = parts[0]
                            if name == "not":
                                inner_bracket_start = signature.find("(")
                                balance = 1
                                inner_bracket_end = -1
                                for kdx in range(inner_bracket_start + 1, len(signature)):
                                    if signature[kdx] == '(':
                                        balance += 1
                                    elif signature[kdx] == ')':
                                        balance -= 1
                                    if balance == 0:
                                        inner_bracket_end = kdx
                                        break
                                inner_signature = signature[inner_bracket_start + 1: inner_bracket_end].strip()
                                inner_parts = inner_signature.split()
                                name, args = inner_parts[0], inner_parts[1:]
                                conditions.append({
                                    "name": name,
                                    "args": args,
                                    "negated": True,
                                })
                            else:
                                args = parts[1:]
                                conditions.append({
                                    "name": name,
                                    "args": args,
                                    "negated": False,
                                })
                        idx = jdx
                        break
                if balance != 0:
                    print(f"Unbalanced parentheses in block: {block}")
                    break
            idx += 1

    return conditions

def parse_objects_from_categorized_response(response, object_types=[]):
    objects = defaultdict(list)
    current_type = None
    
    for line in response.split("\n"):
        line = line.strip()
        
        # Check if this is a type header (e.g., "block:" or "robot:")
        if line.endswith(':'):
            potential_type = line[:-1].strip()
            if not object_types or potential_type in object_types:
                current_type = potential_type
            else:
                current_type = None
        # Check if this is an object entry (starts with "- ")
        elif line.startswith('- ') and current_type:
            object_name = line[2:].strip()  # Remove "- " prefix
            if object_name:
                # Convert spaces to underscores for consistency
                clean_name = "_".join(object_name.split())
                objects[current_type].append(clean_name)
    
    return objects

def parse_objects(response, object_types = []):
    # First try the new categorized format (for VLM responses)
    categorized_result = parse_objects_from_categorized_response(response, object_types)
    if categorized_result and any(obj_list for obj_list in categorized_result.values()):
        return categorized_result
    
    # Fallback to original format (name - type)
    objects = defaultdict(list)
    for line in response.split("\n"):
        if "-" in line:
            name_and_type = line.split("-")
            if len(name_and_type) == 2:
                name, object_type = name_and_type
                name, object_type = name.strip(), object_type.strip()
                name = "_".join(name.split())
                if object_types and object_type not in object_types:
                    continue
                objects[object_type].append(name)

    # Additional fallback for comma-separated format (e.g., "block: green, blue, red")
    if not objects or not any(obj_list for obj_list in objects.values()):
        for line in response.split("\n"):
            line = line.strip()
            if ":" in line:
                parts = line.split(":", 1)
                if len(parts) == 2:
                    object_type = parts[0].strip()
                    objects_str = parts[1].strip()
                    
                    # Check if this type is valid
                    if not object_types or object_type in object_types:
                        # Split by comma and clean up
                        if "," in objects_str:
                            object_names = [name.strip() for name in objects_str.split(",")]
                        else:
                            # Single object or space-separated
                            object_names = objects_str.split()
                        
                        for name in object_names:
                            if name:
                                clean_name = "_".join(name.split())
                                objects[object_type].append(clean_name)

    return objects

def assemble_grounded_predicates(predicates):
    init_states = "    (:init\n"
    for predicate in predicates:
        init_states += f"        ({predicate['name']} {' '.join(predicate['args'])})\n"
    init_states += "    )\n"

    return init_states

def assemble_object_states(objects):
    object_states = "    (:objects\n"
    for object_type, objects in objects.items():
        for obj in objects:
            object_states += f"        {obj} - {object_type}\n"
    object_states += "    )\n"

    return object_states
    
def assemble_pddl(object_states, init_states, goal_states, domain_file):
    domain_name = domain_file.split('(domain ')[1].split(')')[0].strip()
    pddl_file = f"(define (problem {domain_name})"
    pddl_file += f"    (:domain {domain_name})"
    pddl_file += object_states + init_states + goal_states
    pddl_file += ")\n"

    return pddl_file
