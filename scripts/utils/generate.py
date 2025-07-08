import itertools

from .build_prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_plan_prompt,
    build_observation_prompt,
)
from .parse_response import parse_pddl, parse_plan, parse_objects, parse_types, parse_predicates
from .checkers import check_error
# from .sgclip import predict_all_relations

def generate_pddl(
        target, 
        config, 
        model, 
        args,
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

def generate_pddl_end_to_end(
    target,
    config,
    model,
    observations,
    retry_idx,
    generate_caption=False,
    generate_scene_graph=False,
    enable_caption=False,
):
    if retry_idx > 0:
        problem_prompt = build_refine_problem_prompt(
            target, 
            config, 
            generate_caption=generate_caption, 
            generate_scene_graph=generate_scene_graph,
            enable_caption=enable_caption,
        )
    else:
        problem_prompt = build_problem_prompt(
            target, 
            config, 
            generate_caption=generate_caption, 
            generate_scene_graph=generate_scene_graph,
            enable_caption=enable_caption,
        )
    
    if enable_caption:
        response = model.generate(problem_prompt) # No observations
    else:
        response = model.generate(problem_prompt, observations)

    # Match the PDDL file in the response by header and footer
    problem_file = parse_pddl(response)
    if problem_file is None:
        problem_file = ""

    return problem_file, response, problem_prompt

# TODO: load models in main
def generate_multi_step(
    target,
    config,
    model,
    observations,
    retry_idx,
    generate_from_vlm=True,
    generate_from_cv_model=False,
):
    raw_model = model.client["model"]
    raw_model.eval()

    observation_prompt = build_observation_prompt(target, config)
    print(observation_prompt)
    object_response = model.generate(observation_prompt, observations)

    print("--------------------------------")
    print(object_response)

    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)

    print("--------------------------------")
    print(objects)

    predicates = parse_predicates(target["domain"])

    # Build all possible predicates
    all_grounded_predicates = []
    for predicate_name, predicate_info in predicates.items():
        predicate_args = predicate_info["args"]
        if len(predicate_args) == 1:  # unary relation
            typed_objects = objects[predicate_args[0]]
            all_grounded_predicates.extend([
                {
                    predicate_name: [
                        typed_object
                    ]
                }
                for typed_object in typed_objects
            ])

        elif len(predicate_args) == 2:  # binary relation
            type_1, type_2 = predicate_args
            type_1_objects, type_2_objects = objects[type_1], objects[type_2]
            grounded_args = list(itertools.product(type_1_objects, type_2_objects)) # cartesian product
            all_grounded_predicates.extend([
                {
                    predicate_name: [
                        grounded_arg
                    ]
                }
                for grounded_arg in grounded_args
                if grounded_arg[0] != grounded_arg[1]
            ])

        # TODO: add support for arbitrary num of args
        else:
            raise NotImplementedError("Only unary and binary relations are supported")

    print("--------------------------------")
    print(all_grounded_predicates)
            
    import sys; sys.exit()
        

