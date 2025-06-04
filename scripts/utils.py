#!/usr/bin/env python

import os
import random
import argparse

import numpy as np
import torch


def seed_everything(seed: int=42):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = True


def parse_args():
    parser = argparse.ArgumentParser()

    # Data dirs
    parser.add_argument("--result_dir", type=str, default=None, help="direcotry for predicted bboxes, generated problems, and found plans")
    parser.add_argument("--domain", type=str, default=None, help="domain name (cooking/blocksworld/hanoi)")

    # Model args
    parser.add_argument("--model", type=str, default=None, help="model name")
    parser.add_argument("--device", type=str, default="cuda:0", help="device")

    # Main generation stages
    parser.add_argument("--generate_problem", action="store_true", help="generate PDDL problems")
    parser.add_argument("--find_plan", action="store_true", help="refine generated problems by corrective reprompting")

    # End-goal generation choices
    parser.add_argument("--generate_domain", action="store_true", help="generate PDDL domain")
    parser.add_argument("--generate_plan", action="store_true", help="generate end-to-end plans")

    # Intermediate generation choices
    parser.add_argument("--generate_caption", action="store_true", help="generate caption for observation")
    parser.add_argument("--generate_scene_graph", action="store_true", help="generate scene graph for observation")

    # Data config
    parser.add_argument("--clean_image", action="store_true", default=False, help="Present a clean image to the model")

    # Runtime config
    parser.add_argument("--num_tries", type=int, default=1, help="the number of tries for each generation stage")

    # Downward solver
    parser.add_argument("--downward_dir", type=str, default="../downward", help="")
    parser.add_argument("--time_limit", type=int, default=30, help="")

    # related to problem generation and refinement
    parser.add_argument("--seed", type=int, default=42, help="random seed")
    parser.add_argument("--gen_step", type=str, default="base", help="PDDL generation step")
    parser.add_argument("--prev_gen_step", type=str, default="base", help="Previous generation step, used for corrective reprompting")
    parser.add_argument("--num_examples", type=int, default=1, help="the numebr of examples for few-shot prompting")
    parser.add_argument("--num_repeat", type=int, default=1, help="the number of problems to generate per task")
    parser.add_argument("--refine_all", action="store_true", help="refine all problems regardless of errors")
    args = parser.parse_args()

    return args