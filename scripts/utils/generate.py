from .prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_plan_prompt,
    build_object_prompt,
)
from .parsers import parse_pddl, parse_plan, parse_objects, parse_types
from .checkers import check_error

def generate_pddl(
        target, 
        config, 
        model, 
        generate_end_to_end=True,
        generate_scene_graph_first=False,
        generate_caption=False,
        generate_scene_graph=False,
        num_tries=1,
        downward_dir='../downward',
        time_limit=30,
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

    for retry_idx in range(num_tries):
        if generate_end_to_end:
            problem_file, response, problem_prompt = generate_pddl_end_to_end(
                target,
                config,
                model,
                observations,
                retry_idx,
                generate_caption=generate_caption,
                generate_scene_graph=generate_scene_graph,
            )
        elif generate_scene_graph_first:
            problem_file, response, problem_prompt = generate_scene_graph_then_pddl(
                target,
                config,
                model,
                observations,
                retry_idx,
            )

        success, msg = check_error(problem_file, target["domain"], downward_dir, time_limit)

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
):
    if retry_idx > 0:
        problem_prompt = build_refine_problem_prompt(
            target, 
            config, 
            generate_caption=generate_caption, 
            generate_scene_graph=generate_scene_graph
        )
    else:
        problem_prompt = build_problem_prompt(
            target, 
            config, 
            generate_caption=generate_caption, 
            generate_scene_graph=generate_scene_graph
        )
    
    response = model.generate(problem_prompt, observations)

    # Match the PDDL file in the response by header and footer
    problem_file = parse_pddl(response)
    if problem_file is None:
        problem_file = ""

    return problem_file, response, problem_prompt

def generate_scene_graph_then_pddl(
    target,
    config,
    model,
    observations,
    retry_idx,
):
    if retry_idx > 0:
        pass
    
    else:
        prompt = build_object_prompt(target, config)
        print(prompt)

    response = model.generate(prompt, observations)
    print(response)

    objects = parse_objects(response, parse_types(target["domain"]))
    

    print(objects)
    import sys; sys.exit()

    return "", "", ""

