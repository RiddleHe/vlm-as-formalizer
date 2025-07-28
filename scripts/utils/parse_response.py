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
        line = line.strip()
        if not line or not line.startswith("(") or not line.endswith(")"):
            continue
        tokens = line[1:-1].split()
        if not tokens:
            continue
        action_name = tokens[0]
        args = tokens[1:]
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

def parse_plan(response: str) -> str:
    # isolate segment after "Plan:" / "Steps:" if present
    m = re.search(r"(Plan|Steps)\s*:", response, re.IGNORECASE)
    sub = response[m.end():] if m else response

    # capture parenthesised expressions
    items = re.findall(r"\(([^)]+)\)", sub)

    # keep only those that contain at least one space (i.e. more than one token)
    actions = [f"({it.strip()})" for it in items if " " in it.strip()]

    return "\n".join(actions)

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
    types_to_supertypes = {}
    types_block = parse_block(domain_file, "(:types")

    if types_block:
        cleaned_types = re.sub(r";[^\n]*", "", types_block)  # Remove comments
        types_str = cleaned_types.strip()
        if types_str:
            lines = types_str.splitlines()
            all_supertypes = set()
            for line in lines:
                line = line.strip()
                if not line:
                    continue
                if "-" in line:
                    parts = line.split("-")
                    subtypes = parts[0].strip().split(" ")
                    supertype = parts[1].strip()
                    all_supertypes.add(supertype)
                    for subtype in subtypes:
                        if subtype.strip():
                            types_to_supertypes[subtype.strip()] = supertype
                else:
                    standalone_types = line.split()
                    for standalone_type in standalone_types:
                        if standalone_type.strip():
                            types_to_supertypes[standalone_type.strip()] = None
            for supertype in all_supertypes:
                if supertype not in types_to_supertypes:
                    types_to_supertypes[supertype] = None

    def get_type_chain(node_type, types_dict, memo=None):
        if memo is None:
            memo = {}

        if node_type in memo:
            return memo[node_type]

        if node_type not in types_dict or types_dict[node_type] is None:
            memo[node_type] = node_type
            return node_type

        supertype = types_dict[node_type]
        supertype_chain = get_type_chain(supertype, types_dict, memo)
        chain = f"{node_type} -> subtype of {supertype_chain}"
        memo[node_type] = chain
        return chain

    types_dict = {}

    all_types = set(types_to_supertypes.keys())
    for supertype in types_to_supertypes.values():
        if supertype is not None:
            all_types.add(supertype)

    for type_name in all_types:
        types_dict[type_name] = get_type_chain(type_name, types_to_supertypes)

    print(f"Types dict: {types_dict}\n")
    print(f"Types to supertypes: {types_to_supertypes}\n")
    
    return types_dict, types_to_supertypes 

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
    
    # Phrases that indicate no object is present
    no_object_phrases = [
        "no", "none", "not visible", "no .* visible", "no .* is visible", 
        "not present", "cannot see", "don't see", "absent"
    ]
    
    # Create type mapping
    type_mapping = {}
    for obj_type in object_types:
        type_mapping[obj_type] = obj_type
        base_type = obj_type.split('(')[0].strip()
        type_mapping[base_type] = obj_type
    
    for line in response.split("\n"):
        line = line.strip()
        
        # Check if this is a type header
        if line.endswith(':'):
            header = line[:-1].strip()
            
            # Match with known types
            matched_type = None
            if not object_types:
                matched_type = header
            else:
                if header in type_mapping:
                    matched_type = type_mapping[header]
                else:
                    for base, full in type_mapping.items():
                        if base in header:
                            matched_type = full
                            break
            
            current_type = matched_type
            
        elif current_type and line:
            # Skip lines that indicate no object
            line_lower = line.lower()
            if any(re.search(phrase, line_lower) for phrase in no_object_phrases):
                continue
            
            # Skip explanatory text (usually long sentences)
            if len(line.split()) > 10:  # Skip long explanatory sentences
                continue
            
            # Parse object entries
            if line.startswith(('- ', '• ', '* ')):
                line = line[2:].strip()
            
            # Extract object name
            if ' - ' in line:
                object_name = line.split(' - ')[0].strip()
            else:
                object_name = line.strip()
            
            # Clean and validate object name
            if object_name and not object_name.startswith('('):
                clean_name = re.sub(r'[^\w]+', '_', object_name).strip('_')
                
                # Additional validation - skip if too long or contains certain patterns
                if clean_name and len(clean_name) < 50 and not clean_name.lower().startswith('no_'):
                    objects[current_type].append(clean_name)
    
    return objects

def parse_objects(response, object_types={}):
    # Debug output
    print(f"DEBUG: parse_objects called with types: {object_types}")
    
    # # First try the new categorized format (for VLM responses)
    # categorized_result = parse_objects_from_categorized_response(response, object_types)
    # if categorized_result and any(obj_list for obj_list in categorized_result.values()):
    #     print(f"DEBUG: Categorized parsing successful: {dict(categorized_result)}")
    #     return categorized_result
    
    # Fallback to original format (name - type)
    objects = defaultdict(list)
    for line in response.split("\n"):
        line = line.strip()
        if not line:
            continue
            
        # Look for "name - type" pattern
        line = re.sub(r'^[-•*]\s*', '', line)
        match = re.match(r'^(.+?)\s*-\s*(.+)$', line)
        if match:
            name, object_type = match.groups()
            name = name.strip()
            object_type = object_type.strip()
            
            # Clean the name
            clean_name = re.sub(r'[^\w]+', '_', name).strip('_')
            
            # Check if this type matches any of our expected types
            if not object_types:
                objects[object_type].append(clean_name)
            else:
                if object_type in object_types:
                    processed_types = set()
                    current_type = object_type
                    while current_type and current_type not in processed_types:
                        processed_types.add(current_type)
                        objects[current_type].append(clean_name)
                        current_type = object_types.get(current_type)


    print(f"DEBUG: Final parsed objects: {dict(objects)}")

    return objects

def assemble_grounded_predicates(predicates):
    init_states = "    (:init\n"
    for predicate in predicates:
        init_states += f"        ({predicate['name']} {' '.join(predicate['args'])})\n"
    init_states += "    )\n"

    return init_states

def assemble_object_states(objects):
    object_states = "    (:objects\n"
    for object_type, objects_list in objects.items():
        # Clean the type name for PDDL compatibility
        clean_type = object_type.split('(')[0].strip()
        
        for obj in objects_list:
            object_states += f"        {obj} - {clean_type}\n"
    object_states += "    )\n"

    return object_states
    
def assemble_pddl(object_states, init_states, goal_states, domain_file):
    domain_name = domain_file.split('(domain ')[1].split(')')[0].strip()
    pddl_file = f"(define (problem {domain_name})"
    pddl_file += f"    (:domain {domain_name})"
    pddl_file += object_states + init_states + goal_states
    pddl_file += ")\n"

    return pddl_file
