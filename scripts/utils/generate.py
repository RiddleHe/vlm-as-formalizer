import itertools
import os
import sys

from .build_prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_goal_prompt,
    build_plan_prompt,
    build_observation_prompt,
)
from .parse_response import (
    parse_pddl, 
    parse_plan, 
    parse_objects, 
    parse_types, 
    parse_predicates, 
    parse_block,
    assemble_object_states,
    assemble_grounded_predicates,
    assemble_pddl,
)
from .checkers import check_error
from .models import predict_relation_probs
from .sgclip import predict_all_relations, setup_and_load_models, get_classes_ls, get_batched_objects
from .helpers import observations_to_images, extract_relation_types, convert_sgclip_to_relation_preds
from .baseline import (
    generate_multi_step_with_cv,
    generate_multi_step_with_vlm,
    generate_pddl_end_to_end,
    generate_multi_step_with_sgclip_vlm,
    generate_vila_planning,
    generate_villain_pddl,
    generate_villain_gpt41_pddl,
    generate_villain_direct_pddl,
    generate_villain_captioning_pddl,
    generate_villain_captioning_dino_pddl,
    generate_villain_captioning_gpt41_pddl,
    generate_scene_graph_to_pddl,
    generate_scene_graph_dino_pddl,
    generate_scene_graph_gpt41_pddl
)

def generate_pddl(
        target, 
        config, 
        model, 
        args,
        result_dir=None,
        save_step=None,
        task_name=None,
    ):
    observations = target["observations"]
    success = False
    res = {
        "problem": {
            "file": [],
            "response": [],
            "prompt": []
        },
    }
    msg = None

    for retry_idx in range(args.num_tries):
        if args.generate_end_to_end:
            problem_file, response, problem_prompt = generate_pddl_end_to_end(
                target,
                config,
                model,
                observations,
                retry_idx,
                generate_caption=args.generate_caption,
                generate_scene_graph=args.generate_scene_graph,
                enable_caption=args.enable_caption,
            )
        elif args.generate_multi_step:
            problem_file, response, problem_prompt = generate_multi_step(
                target,
                config,
                model,
                observations,
                retry_idx,
                generate_from_vlm=args.generate_from_vlm,
                generate_from_cv_model=args.generate_from_cv_model,
            )
        elif args.generate_multi_step_with_vlm:
            problem_file, response, problem_prompt = generate_multi_step_with_vlm(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_multi_step_with_cv:
            problem_file, response, problem_prompt = generate_multi_step_with_cv(
                target,
                config,
                model,
                observations,
                retry_idx,
                result_dir=result_dir,
                save_step=save_step,
                task_name=task_name,
            )
        elif args.generate_multi_step_with_sgclip_vlm:
            problem_file, response, problem_prompt = generate_multi_step_with_sgclip_vlm(
                target,
                config,
                model,
                observations,
                retry_idx,
                result_dir=result_dir,
                save_step=save_step,
                task_name=task_name,
            )
        elif args.generate_villain_pddl:
            problem_file, response, problem_prompt = generate_villain_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_villain_gpt41_pddl:
            problem_file, response, problem_prompt = generate_villain_gpt41_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_villain_direct_pddl:
            problem_file, response, problem_prompt = generate_villain_direct_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_villain_captioning_pddl:
            problem_file, response, problem_prompt = generate_villain_captioning_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_villain_captioning_dino_pddl:
            problem_file, response, problem_prompt = generate_villain_captioning_dino_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_villain_captioning_gpt41_pddl:
            problem_file, response, problem_prompt = generate_villain_captioning_gpt41_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
        elif args.generate_scene_graph_pddl:
            hard_template = getattr(args, 'hard_template', True)
            problem_file, response, problem_prompt = generate_scene_graph_to_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
                hard_template
            )
        elif args.generate_scene_graph_dino_pddl:
            hard_template = getattr(args, 'hard_template', True)
            problem_file, response, problem_prompt = generate_scene_graph_dino_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
                hard_template
            )
        elif args.generate_scene_graph_gpt41_pddl:
            hard_template = getattr(args, 'hard_template', True)
            problem_file, response, problem_prompt = generate_scene_graph_gpt41_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
                hard_template
            )
        elif args.generate_vila_planning:
            plan, response, problem_prompt = generate_vila_planning(
                target,
                config,
                model,
                observations,
                retry_idx,
            )
            # For planning pipelines, we store plan instead of problem_file
            res["plan"] = plan
            res["response"] = response  
            res["prompt"] = problem_prompt
            return res, True
        else:
            raise ValueError(f"Invalid generation method: {args.generate_method}")
        

        success, msg = check_error(problem_file, target["domain"], args.downward_dir, args.time_limit)

        if not success:
            print(f"Attempt {retry_idx+1} failed: \n{msg}")

            target["response"] = response
            target["error"] = msg


        res["problem"]["file"].append(problem_file)
        res["problem"]["response"].append(response)
        res["problem"]["prompt"].append(problem_prompt)

        if success:
            break

    return res, success
