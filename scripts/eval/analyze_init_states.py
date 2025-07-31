import os
from collections import defaultdict
import re
import json
import numpy as np

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

def get_init_state(pf):
    init_states = []

    init_match = re.search(r':init\s*(.*?)\)\s*(?=\(:goal)', pf, re.DOTALL)
    init_content = init_match.group(1)

    condition_pattern = r'\(([^)]+)\)'
    for match in re.finditer(condition_pattern, init_content):
        condition_text = match.group(1).strip()
        if not condition_text or condition_text.startswith(';'):
            continue
        parts = condition_text.split()
        if parts:
            condition_string = "_".join(parts)
            init_states.append(condition_string)

    return init_states

def get_goal_state(pf):
    goal_start = pf.find(':goal')
    if goal_start == -1:
        return []
    
    and_start = pf.find('(and', goal_start)
    if and_start == -1:
        return []

    paren_count = 1
    i = and_start + 1

    while i < len(pf) and paren_count > 0:
        if pf[i] == "(":
            paren_count += 1
        elif pf[i] == ")":
            paren_count -= 1
        i += 1
    
    if paren_count != 0:
        return []
    
    and_content = pf[and_start:i]
    inner_content = and_content[4:-1]

    conditions = []
    condition_pattern = r'\(([^()]+)\)'

    for match in re.finditer(condition_pattern, inner_content):
        condition_text = match.group(1).strip()
        if condition_text:
            parts = condition_text.split()
            conditions.append("_".join(parts))

    return conditions
    
def get_pddl(path):
    if os.path.exists(os.path.join(path, "problem.pddl")):
        with open(os.path.join(path, "problem.pddl"), "r") as f:
            pf = f.read()
    else:
        with open(os.path.join(path, "problem-try-2.pddl"), "r") as f:
            pf = f.read()

    return pf

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
        parts = gt_state.split("_")
        predicate = parts[0]
        objects = parts[1:]

        mapped_objects = []

        for obj in objects:
            mapped_objects.append(gt_object_to_pred_object[obj])

        mapped_state = "_".join([predicate] + mapped_objects)
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

def process_task(task_path, data_path, task):
    stats = {}

    gt_task = os.path.join(data_path, task)
    assert os.path.exists(gt_task), f"GT task {gt_task} does not exist"

    pred_pf = get_pddl(task_path)
    gt_pf = get_pddl(gt_task)

    pred_objects = get_objects(pred_pf)
    gt_objects = get_objects(gt_pf)

    # print(f"pred_objects: {pred_objects}")
    # print(f"gt_objects: {gt_objects}")

    gt_object_to_pred_object = get_object_mapping(gt_objects, pred_objects)
    
    # print(f"gt_object_to_pred_object: {gt_object_to_pred_object}")
    
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
    if len(unmatched_gt_objects) > 0:
        print(f"Task {task} has unmatched gt object: {unmatched_gt_objects}")
        print(f"pred_objects: {pred_objects}")
    if len(unmatched_pred_objects) > 0:
        print(f"Task {task} has unmatched pred object: {unmatched_pred_objects}")
        print(f"gt_objects: {gt_objects}")

    # print(f"stats: {stats}")

    pred_init_states = get_init_state(pred_pf)
    gt_init_states = get_init_state(gt_pf)

    # print(f"pred_init_states: {pred_init_states}")
    # print(f"gt_init_states: {gt_init_states}")

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
    # if len(unmatched_gt) > 0:
    #     print(f"Task {task} has unmatched gt init: {unmatched_gt}")
    #     # print(f"gt_init_states: {gt_init_states}")
    #     print(f"pred_init_states: {pred_init_states}")

    # print(f"Goal states: {pred_pf[pred_pf.find(':goal'):]}")

    gt_goal_states = get_goal_state(gt_pf)
    pred_goal_states = get_goal_state(pred_pf)
    pred_goal_states = [state for state in pred_goal_states if "on_" in state]

    # print(f"gt_goal_states: {gt_goal_states}")
    # print(f"pred_goal_states: {pred_goal_states}")

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
    # if len(unmatched_gt_goal) > 0:
    #     print(f"Task {task} has unmatched gt goal: {unmatched_gt_goal}")
    #     # print(f"gt goal states: {gt_goal_states}")
    #     print(f"pred goal states: {pred_goal_states}")
    

    # print(f"stats: {stats}")

    print(f"-" * 100)

    return stats

def iterate_dir(full_dir_path):
    data_path = "/local-ssd/alfred/blocksworld-real"
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

        task_stats = process_task(task_path, data_path, task)
        stats["tasks"].append(task_stats)

        # if i > 16:
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

iterate_dir("/local-ssd/villain/results/formal_experiments/blocksworld-real_qwen72B_multi_step_vlm_blocksreal_qwenvl-72B-vllm_generate_multi_step_with_vlm_no_batch_relations")