import os
from collections import deque
import subprocess
import json
from tqdm import tqdm
import sys

def main():
    vila = False
    if len(sys.argv) > 1 and sys.argv[1] == "vila":
        vila = True
        
    exp_dir = "/local-ssd/mh3897/villain/results/formal_experiments"
    metrics = []

    for exp in tqdm(sorted(os.listdir(exp_dir))):
        if not exp.startswith("alfred") and not exp.startswith("blocksworld-real"):
            continue

        if not "gpt-4.1" in exp and not "qwenvl-72B" in exp:
            continue

        if "alfred" in exp: domain = "alfred"
        elif "blocksworld-real" in exp: domain = "blocksworld-real"

        if vila:
            if "vila" not in exp:
                continue
        else:
            if "vila" in exp:
                continue

        find_plan_arg = "--find_vila_plan" if vila else "--find_plan"
        
        command = f"python main.py --domain {domain} --result_dir_full {exp} {find_plan_arg}"
        command = f"({command}) 2>&1 | tail -n 5"
        output = subprocess.check_output(
            command, shell=True, text=True
        )
        lines = output.split("\n")

        plan_success_str = ""
        solver_success_str = ""

        for line in lines:
            if "Plan Success Rate:" in line:
                plan_success_str = line.strip().split("Plan Success Rate:")[1]
            if "Solver Success Rate" in line:
                solver_success_str = line.strip().split("Solver Success Rate")[1]

        metric = {
            "experiment": exp,
            "plan_success_rate": plan_success_str,
            "solver_success_rate": solver_success_str,
        }
        print(f"{exp}: {plan_success_str} {solver_success_str}")
    
        with open(f"metrics_{'vila' if vila else 'pddl'}.jsonl", "a") as f:
            f.write(json.dumps(metric) + "\n")
        
        metrics.append(metric)

    with open("metrics_all.jsonl", "w") as f:
        for metric in metrics:
            f.write(json.dumps(metric) + "\n")

if __name__ == "__main__":
    main()