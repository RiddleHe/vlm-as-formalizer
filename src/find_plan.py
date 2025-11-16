from utils.checkers import find_plan
from utils.helpers import format_command

import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--domain", type=str, required=True)
parser.add_argument("--problem", type=str, required=True)
parser.add_argument("--downward_dir", type=str, default="/home/mh3897/pddl/villain/downward", help="Path to downward directory")
parser.add_argument("--time_limit", type=int, default=20, help="Time limit for the planner")

args = parser.parse_args()

plan_path = args.problem.replace("problems", "plans").replace(".pddl", ".txt")

command = format_command(args.domain, args.problem, plan_path, args.downward_dir, args.time_limit)

print(command)

success, err = find_plan(command, plan_path)

print(success, err)
