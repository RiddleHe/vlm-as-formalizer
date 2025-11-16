import os
from collections import deque
import subprocess
import json
from tqdm import tqdm
import sys

from utils.checkers import find_plan
from utils.helpers import format_command

def main():
        
    exp_dir = "/local-ssd/mh3897/villain/results/formal_experiments"
    metrics = []

    recal_dir = os.path.join(os.path.dirname(exp_dir), "alfred_recalculated")
    os.makedirs(recal_dir, exist_ok=True)

    for exp in tqdm(sorted(os.listdir(exp_dir))):
        if not exp.startswith("alfred"):
            continue

        if not "gpt-4.1" in exp and not "qwenvl-72B" in exp:
            continue

        if "vila" in exp:
            continue

        find_plan_arg = "--find_plan"
        domain = "alfred"
        
        solver_passes = 0
        plan_successes = 0
        n_tasks = 0

        for task in sorted(os.listdir(os.path.join(exp_dir, exp))):
            if not os.path.isdir(os.path.join(exp_dir, exp, task)):
                continue

            task_recal_dir = os.path.join(recal_dir, exp, task)
            os.makedirs(task_recal_dir, exist_ok=True)

            n_tasks += 1
            problem_path = f"{exp_dir}/{exp}/{task}/problem.pddl"
            if not os.path.exists(problem_path):
                continue



if __name__ == "__main__":
    main()