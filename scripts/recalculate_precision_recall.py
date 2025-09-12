import os
from collections import defaultdict
import re
import json
import numpy as np
import sys

def get_objects(pf):
    objects_match = re.search(r':objects\s*(.*?)\s*\)\s*(?=\()', pf, re.DOTALL)

    objects_content = objects_match.group(1)
    object_set = set()

    for line in objects_content.strip().split("\n"):
        line = line.strip()
        if not line:
            continue
        if " - " in line:
            parts = line.split(" - ")
            object_names = parts[0].strip().split()
        else:
            object_names = line.strip().split()
        
        object_set.update(object_names)
        
    return object_set

def get_init_state(pf, is_pred=False):
    init_states = []

    init_start = pf.find(':init')
    if init_start == -1:
        return []

    i = init_start + 5 # skip ":init"

    while i < len(pf) and pf[i] in ' \n\t':
        i += 1
    
    goal_start = pf.find(':goal')
    init_end = goal_start

    while i < init_end:
        while i < init_end and pf[i] in ' \n\t':
            i += 1

        if i >= init_end:
            break

        if pf[i] == '(':
            condition_start = i
            paren_count = 1
            i += 1

            while i < init_end and paren_count > 0:
                if pf[i] == '(':
                    paren_count += 1
                elif pf[i] == ')':
                    paren_count -= 1
                i += 1

                if paren_count == 0:
                    condition_text = pf[condition_start + 1:i - 1].strip()
                    if condition_text and not condition_text.startswith(';'):
                        parts = condition_text.split()
                        if is_pred:
                            parts = [normalize_object_name(p, is_gt=True) for p in parts]
                        init_states.append("*".join(parts))
        else:
            i += 1

    return init_states

def get_goal_state(pf, is_pred=False):
    goal_start = pf.find(':goal')
    if goal_start == -1:
        return []
    
    and_start = pf.find('(and', goal_start)
    if and_start == -1:
        return []

    i = and_start + 4 # skip "(and"
    conditions = []

    while i < len(pf):
        while i < len(pf) and pf[i] in ' \n\t':
            i += 1

        if i >= len(pf) or pf[i] == ')':
            break

        if pf[i] == '(':
            condition_start = i
            paren_count = 1
            i += 1

            while i < len(pf) and paren_count > 0:
                if pf[i] == '(':
                    paren_count += 1
                elif pf[i] == ')':
                    paren_count -= 1
                i += 1
                
                if paren_count == 0:
                    condition_text = pf[condition_start + 1:i - 1].strip()
                    if condition_text:
                        parts = condition_text.split()
                        if is_pred:
                            parts = [normalize_object_name(p, is_gt=True) for p in parts]
                        conditions.append("*".join(parts))

        else:
            i += 1

    return conditions
    
def get_pddl(path):
    if os.path.exists(os.path.join(path, "problem.pddl")):
        with open(os.path.join(path, "problem.pddl"), "r") as f:
            pf = f.read()
    else:
        with open(os.path.join(path, "problem-try-2.pddl"), "r") as f:
            pf = f.read()

    return pf

def calculate_indel_distance(s1, s2):
    """
    Calculate edit distance allowing only insertions and deletions (no substitutions).
    This is useful for matching "lamp" with "desklamp" or "pen" with "pencil".
    """
    m, n = len(s1), len(s2)
    
    # Create DP table
    dp = [[float('inf')] * (n + 1) for _ in range(m + 1)]
    
    # Base cases
    for i in range(m + 1):
        dp[i][0] = i  # Delete all characters from s1
    for j in range(n + 1):
        dp[0][j] = j  # Insert all characters to get s2
    
    # Fill DP table
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i-1] == s2[j-1]:
                # Characters match, no operation needed
                dp[i][j] = dp[i-1][j-1]
            else:
                # Only allow insertions and deletions
                dp[i][j] = min(
                    dp[i-1][j] + 1,    # Delete from s1
                    dp[i][j-1] + 1     # Insert into s1
                )
    
    return dp[m][n]


def normalize_object_name(name, is_gt=False):
    normalized = re.sub(r'[_\d]', '', name)

    if is_gt:
        pass
        # spaced = ''
        # for i, char in enumerate(normalized):
        #     if char.isupper() and i > 0:
        #         spaced += ' ' + char
        #     else:
        #         spaced += char

        # words = spaced.split()
        # normalized = words[-1]

    normalized = normalized.lower()
    
    return normalized

def find_equiv_substr(term, equivalence_map):
    for i in range(len(term)):
        for j in range(i + 1, len(term) + 1):
            substr = term[i:j]
            if substr in equivalence_map:
                return equivalence_map[substr]
    return None

def are_equivalent_terms(term1, term2):
    equivalence_pairs = {
        ('agent', 'robot'),
        ('stand', 'table'),
    }
    
    if (term1, term2) in equivalence_pairs or (term2, term1) in equivalence_pairs:
        return True

    equivalence_map = {}
    for a, b in equivalence_pairs:
        equivalence_map[a] = b
        equivalence_map[b] = a
    
    term1_equiv = find_equiv_substr(term1, equivalence_map)
    if term1_equiv:
        return term1_equiv in term2

    term2_equiv = find_equiv_substr(term2, equivalence_map)
    if term2_equiv:
        return term2_equiv in term1

    return False

def get_object_mapping_relaxed(gt_objects, pred_objects, max_distance_ratio):
    pred_objects = set(sorted(list(pred_objects)))  # prioritize based on name
    gt_objects = set(sorted(list(gt_objects)))
    
    gt_object_to_pred_object = {}
    used_pred_objects = set()
    
    for gt_obj in gt_objects:
        gt_normalized = normalize_object_name(gt_obj, is_gt=True)
        best_match = None
        best_distance = float('inf')
        
        for pred_obj in pred_objects:
            if pred_obj in used_pred_objects:
                continue
                
            pred_normalized = normalize_object_name(pred_obj)
            
            distance = calculate_indel_distance(gt_normalized, pred_normalized)
            
            # Calculate distance ratio (relative to longer string)
            max_len = max(len(gt_normalized), len(pred_normalized))
            if max_len > 0:
                distance_ratio = distance / max_len
            else:
                distance_ratio = 0
            
            # Check if this is a valid match
            if distance_ratio <= max_distance_ratio and distance < best_distance:
                best_distance = distance
                best_match = pred_obj
        
        if best_match:
            gt_object_to_pred_object[gt_obj] = best_match
            used_pred_objects.add(best_match)
        else:
            for pred_obj in pred_objects:
                if pred_obj in used_pred_objects:
                    continue

                pred_normalized = normalize_object_name(pred_obj)
                if are_equivalent_terms(gt_normalized, pred_normalized):
                    best_match = pred_obj
                    gt_object_to_pred_object[gt_obj] = pred_obj
                    used_pred_objects.add(best_match)
                    break

            if not best_match:
                gt_object_to_pred_object[gt_obj] = "None"
    
    return gt_object_to_pred_object

def get_object_mapping(gt_objects, pred_objects):
    gt_object_to_pred_object = {}
    pred_objects_concat = "|".join(pred_objects)

    for gt_obj in gt_objects:
        if gt_obj in pred_objects_concat:
            for pred_obj in pred_objects:
                if gt_obj in pred_obj:
                    gt_object_to_pred_object[gt_obj] = pred_obj
                    break
        else:
            gt_object_to_pred_object[gt_obj] = "None"

    return gt_object_to_pred_object

def get_mapped_gt_states(gt_object_to_pred_object, gt_states):
    mapped_gt_states = set()

    for gt_state in gt_states:
        parts = gt_state.split("*")
        predicate = parts[0]
        objects = parts[1:]

        mapped_objects = []

        for obj in objects:
            mapped_objects.append(normalize_object_name(gt_object_to_pred_object[obj]))

        mapped_state = "*".join([normalize_object_name(predicate)] + mapped_objects)
        mapped_gt_states.add(mapped_state)

    return mapped_gt_states

def f1(precision, recall):
    if precision == 0 and recall == 0:
        return 0
    return 2 * precision * recall / (precision + recall)

def division(a, b):
    if b == 0:
        return 0
    return a / b

def process_task(task_path, data_path, task, data_type):
    stats = {}

    gt_task = os.path.join(data_path, task)
    assert os.path.exists(gt_task), f"GT task {gt_task} does not exist"

    pred_pf = get_pddl(task_path)
    gt_pf = get_pddl(gt_task)

    pred_objects = get_objects(pred_pf)
    gt_objects = get_objects(gt_pf)

    # print(f"pred_objects: {pred_objects}")
    # print(f"gt_objects: {gt_objects}")

    gt_object_to_pred_object = get_object_mapping_relaxed(
        gt_objects, pred_objects, max_distance_ratio=0.8
    )
    
    # print(f"gt_object_to_pred_object: {gt_object_to_pred_object}\n")
    
    non_none_count = sum(
        1 for obj 
        in gt_object_to_pred_object.values() 
        if obj != "None"
    )
    object_precision = division(non_none_count, len(pred_objects))
    object_recall = division(non_none_count, len(gt_objects))

    unmatched_gt_objects = {
        gt_obj for gt_obj, pred_obj in gt_object_to_pred_object.items() 
        if pred_obj == "None"
    }

    mapped_pred_objects = {
        pred_obj for pred_obj in gt_object_to_pred_object.values()
        if pred_obj != "None"
    }
    unmatched_pred_objects = pred_objects - mapped_pred_objects

    stats["object_precision"] = object_precision
    stats["object_recall"] = object_recall
    stats["pred_object_count"] = len(pred_objects)
    stats["gt_object_count"] = len(gt_objects)
    stats["pred_true_positives"] = non_none_count
    stats["gt_false_negatives"] = len(unmatched_gt_objects)
    stats["pred_false_positives"] = len(unmatched_pred_objects)
    # if len(unmatched_gt_objects) == 0 and len(unmatched_pred_objects) == 0:
    #     print(f"✨ Objects mapped successfully.\n")
    # if len(unmatched_gt_objects) > 0:
    #     print(f"🚨 Task {task} has unmatched gt object: {unmatched_gt_objects}\n")
    #     print(f"pred_objects: {pred_objects}\n")
    # if len(unmatched_pred_objects) > 0:
    #     print(f"🚨 Task {task} has unmatched pred object: {unmatched_pred_objects}\n")
    #     print(f"gt_objects: {gt_objects}\n")

    # print(f"stats: {stats}")

    pred_init_states = get_init_state(pred_pf, is_pred=True)
    gt_init_states = get_init_state(gt_pf)

    # print(f"pred_init_states: {pred_init_states}\n")
    # print(f"gt_init_states: {gt_init_states}\n")

    mapped_gt_states = get_mapped_gt_states(gt_object_to_pred_object, gt_init_states)

    pred_set = set(pred_init_states)
    matched_states = pred_set.intersection(mapped_gt_states)

    unmatched_pred = pred_set - matched_states
    unmatched_gt = mapped_gt_states - matched_states

    init_precision = division(len(matched_states), len(pred_init_states))
    init_recall = division(len(matched_states), len(mapped_gt_states))

    stats["init_precision"] = init_precision
    stats["init_recall"] = init_recall
    stats["init_true_positives"] = len(matched_states)
    stats["init_false_positives"] = len(unmatched_pred)
    stats["init_false_negatives"] = len(unmatched_gt)
    # if len(unmatched_gt) == 0 and len(unmatched_pred) == 0:
    #     print(f"✨ Init states mapped successfully.\n")
    if len(unmatched_gt) > 0:
        print(f"🚨 Task {task} has unmatched gt init: {unmatched_gt}")
        print(f"gt_init_states: {gt_init_states}")
        # print(f"pred_init_states: {pred_init_states}\n")
        sys.exit()
    # if len(unmatched_pred) > 0:
    #     print(f"🚨 Task {task} has unmatched pred init: {unmatched_pred}")
    #     print(f"gt_init_states: {gt_init_states}\n")

    gt_goal_states = get_goal_state(gt_pf)
    pred_goal_states = get_goal_state(pred_pf, is_pred=True)
    if data_type == "blocksworld-real":
        pred_goal_states = [state for state in pred_goal_states if "on*" in state]

    mapped_goal_state = get_mapped_gt_states(gt_object_to_pred_object, gt_goal_states)

    # print(f"mapped_goal_state: {mapped_goal_state}")

    pred_goal_set = set(pred_goal_states)
    matched_goal_states = pred_goal_set.intersection(mapped_goal_state)

    unmatched_pred_goal = pred_goal_set - matched_goal_states
    unmatched_gt_goal = mapped_goal_state - matched_goal_states

    goal_precision = division(len(matched_goal_states), len(pred_goal_states))
    goal_recall = division(len(matched_goal_states), len(mapped_goal_state))

    stats["goal_precision"] = goal_precision
    stats["goal_recall"] = goal_recall
    stats["goal_true_positives"] = len(matched_goal_states)
    stats["goal_false_positives"] = len(unmatched_pred_goal)
    stats["goal_false_negatives"] = len(unmatched_gt_goal)
    # if len(unmatched_gt_goal) == 0 and len(unmatched_pred_goal) == 0:
    #     print(f"✨ Goal states mapped successfully.\n")
    # if len(unmatched_gt_goal) > 0:
    #     print(f"🚨 Task {task} has unmatched gt goal: {unmatched_gt_goal}")
    #     print(f"pred goal states: {pred_goal_states}\n")
    # if len(unmatched_pred_goal) > 0:
    #     print(f"🚨 Task {task} has unmatched pred goal: {unmatched_pred_goal}")
    #     print(f"gt goal states: {gt_goal_states}\n")

    # newline = '\n'
    # stats_str = [f"{k}: {v}" for k, v in stats.items()]
    # print(f"stats: {newline.join(stats_str)}\n")

    # print(f"-" * 100)

    return stats

def iterate_dir(full_dir_path):
    dir_path = os.path.basename(full_dir_path)
    if dir_path.startswith("blocksworld-real"):
        data_path = "/local-ssd/mh3897/alfred/blocksworld-real"
        data_type = "blocksworld-real"
    elif dir_path.startswith("alfred"):
        data_path = "/local-ssd/mh3897/alfred/alfred_137"
        data_type = "alfred"

    stats = {
        "object_average_precision": 0,
        "object_average_recall": 0,
        "object_average_f1": 0,
        "init_average_precision": 0,
        "init_average_recall": 0,
        "init_average_f1": 0,
        "goal_average_precision": 0,
        "goal_average_recall": 0,
        "goal_average_f1": 0,
        "tasks": []
    }

    for i, task in enumerate(os.listdir(full_dir_path)):
        task_path = os.path.join(full_dir_path, task)
        if not os.path.isdir(task_path):
            continue

        task_stats = process_task(task_path, data_path, task, data_type)
        stats["tasks"].append(task_stats)

        # if i > 10:
        #     break

        object_f1 = f1(task_stats["object_precision"], task_stats["object_recall"])
        init_f1 = f1(task_stats["init_precision"], task_stats["init_recall"])
        goal_f1 = f1(task_stats["goal_precision"], task_stats["goal_recall"])

        stats["object_average_precision"] += task_stats["object_precision"]
        stats["object_average_recall"] += task_stats["object_recall"]
        stats["object_average_f1"] += object_f1

        stats["init_average_precision"] += task_stats["init_precision"]
        stats["init_average_recall"] += task_stats["init_recall"]
        stats["init_average_f1"] += init_f1

        stats["goal_average_precision"] += task_stats["goal_precision"]
        stats["goal_average_recall"] += task_stats["goal_recall"]
        stats["goal_average_f1"] += goal_f1

    stats["object_average_precision"] /= len(stats["tasks"])
    stats["object_average_recall"] /= len(stats["tasks"])
    stats["object_average_f1"] /= len(stats["tasks"])

    stats["init_average_precision"] /= len(stats["tasks"])
    stats["init_average_recall"] /= len(stats["tasks"])
    stats["init_average_f1"] /= len(stats["tasks"])

    stats["goal_average_precision"] /= len(stats["tasks"])
    stats["goal_average_recall"] /= len(stats["tasks"])
    stats["goal_average_f1"] /= len(stats["tasks"])

    print(f"Directory: {full_dir_path}")
    print(f"Object Average Precision: {stats['object_average_precision']}")
    print(f"Object Average Recall: {stats['object_average_recall']}")
    print(f"Object Average F1: {stats['object_average_f1']}")
    print(f"Init Average Precision: {stats['init_average_precision']}")
    print(f"Init Average Recall: {stats['init_average_recall']}")
    print(f"Init Average F1: {stats['init_average_f1']}")
    print(f"Goal Average Precision: {stats['goal_average_precision']}")
    print(f"Goal Average Recall: {stats['goal_average_recall']}")
    print(f"Goal Average F1: {stats['goal_average_f1']}")

    # with open("stats.json", "w") as f:
    #     json.dump(stats, f)
root_dir = "/local-ssd/mh3897/villain/results/formal_experiments"
lists_to_test = [
    f"{root_dir}/{dir_name}"
    for dir_name in os.listdir(root_dir)
    if dir_name.startswith("alfred") \
        and (model_name in dir_name for model_name in ["gpt-4.1", "qwenvl-72B"]) \
            and "vila" not in dir_name
]

for dir_path in lists_to_test:
    # print(f"Full path: {dir_path}")
    iterate_dir(dir_path)
    print(f"-" * 100)