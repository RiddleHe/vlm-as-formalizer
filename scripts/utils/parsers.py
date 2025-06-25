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

def parse_objects(response, object_types):
    objects = defaultdict(list)
    for line in response.split("\n"):
        if ":" in line:
            object_type, object_names = line.split(":")
            for object_name in object_names.split(","):
                object_name = object_name.split("(")[0].strip()
                objects[object_type].append(object_name)

    return objects

