from .checkers import check_error
from .baseline import (
    generate_multi_step_with_vlm,
    generate_vila_planning,
    generate_villain_pddl,
    generate_villain_direct_pddl,
    generate_villain_captioning_pddl,
    generate_scene_graph_to_pddl,
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
        if args.generate_multi_step_with_vlm:
            problem_file, response, problem_prompt = generate_multi_step_with_vlm(
                target,
                config,
                model,
                observations,
                retry_idx,
                batch_relations=args.batch_relations,
            )
        elif args.generate_villain_pddl:
            problem_file, response, problem_prompt = generate_villain_pddl(
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
