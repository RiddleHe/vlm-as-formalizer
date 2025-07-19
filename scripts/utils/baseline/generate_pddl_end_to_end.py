from ..build_prompts import build_problem_prompt, build_refine_problem_prompt
from ..parse_response import parse_pddl

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