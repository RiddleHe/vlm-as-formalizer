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
    types = []
    supertypes_seen = set()
    base_types = set()
    
    types_block = parse_block(domain_file, "(:types")

    if types_block:
        cleaned_types = re.sub(r";[^\n]*", "", types_block)  # Remove comments
        types_str = cleaned_types.strip()
        if types_str:
            lines = types_str.splitlines()
            for line in lines:
                line = line.strip()
                if not line:
                    continue
                if "-" in line:
                    parts = line.split("-")
                    subtypes = parts[0].strip().split()
                    supertype = parts[1].strip()
                    supertypes_seen.add(supertype)
                    for subtype in subtypes:
                        if subtype:
                            types.append(f"{subtype} ({supertype})")
                            base_types.add(subtype)
                            
                else:
                    standalone_types = line.split()
                    for standalone_type in standalone_types:
                        if standalone_type:
                            types.append(standalone_type)
                            base_types.add(standalone_type)

            for supertype in supertypes_seen:
                if supertype not in base_types:
                    types.append(supertype)

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

def _normalize_object_name(name: str) -> str:
    value = name.strip()
    if not value:
        return ""

    value = value.strip(",.;")
    if value.startswith("-"):
        value = value[1:].strip()

    # Remove trailing type hints such as "(receptacle)" from names.
    value = re.sub(r"\s*\([^)]*\)\s*$", "", value)
    value = value.replace("-", "_")
    value = re.sub(r"\s+", "_", value)
    value = re.sub(r"[^A-Za-z0-9_]", "", value)
    value = re.sub(r"_+", "_", value).strip("_")

    lowered = value.lower()
    if lowered in {"", "none", "null", "na", "n_a", "empty"}:
        return ""
    return value


def _canonical_type_label(type_name: str) -> str:
    return re.sub(r"\s+", " ", type_name.strip())


def _base_type_name(type_name: str) -> str:
    canonical = _canonical_type_label(type_name)
    if "(" in canonical and canonical.endswith(")"):
        return canonical.split("(", 1)[0].strip()
    return canonical


def _type_lookup(object_types):
    lookup = {}
    for original in object_types:
        canonical = _canonical_type_label(original)
        base = _base_type_name(original)
        lookup[canonical] = base
        lookup[base] = base
        short = canonical.split("(", 1)[0].strip()
        if short and short not in lookup:
            lookup[short] = base
    return lookup


def _resolve_type_name(candidate: str, object_types, lookup):
    canonical = _canonical_type_label(candidate)
    if not object_types:
        return canonical
    if canonical in lookup:
        return lookup[canonical]
    return None


def _split_inline_objects(objects_str: str, object_type: str):
    raw = objects_str.strip()
    if not raw:
        return []
    if raw.lower() in {"none", "null", "na", "n/a", "[]"}:
        return []

    raw = raw.replace(",", " ")
    tokens = [tok for tok in raw.split() if tok]
    if not tokens:
        return []

    # Backward compatibility: "green block blue block" -> green_block blue_block
    base_type = object_type.split("(", 1)[0].strip().split()[-1].lower()
    if (
        base_type
        and len(tokens) % 2 == 0
        and all(tokens[idx + 1].lower() == base_type for idx in range(0, len(tokens), 2))
    ):
        tokens = [f"{tokens[idx]}_{tokens[idx+1]}" for idx in range(0, len(tokens), 2)]

    normalized = []
    for token in tokens:
        clean = _normalize_object_name(token)
        if not clean:
            continue
        if clean.lower() == base_type:
            continue
        normalized.append(clean)
    return normalized


def parse_objects_from_categorized_response(response, object_types=[]):
    objects = defaultdict(list)
    seen = defaultdict(set)
    current_type = None
    lookup = _type_lookup(object_types)

    for line in response.split("\n"):
        line = line.strip()
        if not line:
            continue

        # Unified format: "<type>: <object_1> <object_2>"
        if ":" in line:
            potential_type, values = line.split(":", 1)
            resolved_type = _resolve_type_name(potential_type, object_types, lookup)
            if resolved_type:
                current_type = resolved_type
                for object_name in _split_inline_objects(values, resolved_type):
                    if object_name not in seen[resolved_type]:
                        seen[resolved_type].add(object_name)
                        objects[resolved_type].append(object_name)
                continue

        # Backward compatible bullet format:
        # block:
        # - green_block
        if line.endswith(":"):
            potential_type = line[:-1].strip()
            current_type = _resolve_type_name(potential_type, object_types, lookup)
            continue

        if line.startswith("- ") and current_type:
            object_name = _normalize_object_name(line[2:])
            if object_name and object_name not in seen[current_type]:
                seen[current_type].add(object_name)
                objects[current_type].append(object_name)

    return objects

def parse_objects(response, object_types = []):
    # First try categorized/unified format.
    categorized_result = parse_objects_from_categorized_response(response, object_types)
    if categorized_result and any(obj_list for obj_list in categorized_result.values()):
        return categorized_result
    
    # Fallback: original format "<object> - <type>"
    objects = defaultdict(list)
    seen = defaultdict(set)
    lookup = _type_lookup(object_types)

    for line in response.split("\n"):
        if "-" in line:
            name_and_type = line.rsplit("-", 1)
            if len(name_and_type) == 2:
                name, object_type = name_and_type
                resolved_type = _resolve_type_name(object_type, object_types, lookup)
                if object_types and not resolved_type:
                    continue
                resolved_type = resolved_type or _canonical_type_label(object_type)
                name = _normalize_object_name(name)
                if name and name not in seen[resolved_type]:
                    seen[resolved_type].add(name)
                    objects[resolved_type].append(name)

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
