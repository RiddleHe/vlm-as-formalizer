"""Build prompts for different tasks."""

from .parse_response import parse_types, parse_predicates

def build_problem_prompt(target, config, add_examples=True, generate_caption=False, generate_scene_graph=False, enable_caption=False):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL file with objects, initial state, and goal specification.
    Your output should adhere to the constraints defined in the domain file.
    You must output the PDDL file in the correct format.
    """

    example_prompt = f"""Examples of PDDL problems given a different domain instruction:
    Domain: hanoi
    Instruction: Move all disks to the rightmost peg.
    PDDL problem:
    (define (problem hanoi3)
        (:domain hanoi)
        (:objects
            peg1
            peg2
            orange_disk1
            orange_disk2
        )
            (:init
                (clear orange_disk1)
                (on orange_disk1 orange_disk2)
                (on orange_disk2 peg1)
            )
        (:goal (and (on orange_disk2 peg2) (on orange_disk1 orange_disk2)))
    )
    """

    if add_examples:
        prompt += example_prompt

    prompt += f"""
    For the current domain, this is the domain file:
    {target["domain"]}
    """
    
    if generate_caption:
        prompt += f"""
        The image of the scene has been provided.
        You must first generate a caption for the image.
        Then use the caption to generate the PDDL problem.
        Do not generate anything after the PDDL problem.
        Format:
        Caption: <caption>
        PDDL problem: <PDDL problem>
        """
    elif generate_scene_graph:
        prompt += build_scene_graph_template(target["domain"])
    elif enable_caption:
        prompt += f"""
        The caption of the image has been provided along with the instruction below.
        Please first analyze the caption and then generate the PDDL problem.
        """
    else:
        prompt += f"""
        The image of the scene has been provided.
        Please first analyze the image and then generate the PDDL problem.
        """

    prompt += f"""
    {config.get("text", "") if config else ""}
    Instruction: {target["instruction"]}
    """
    
    return prompt

def build_scene_graph_template(domain_file):
    types = parse_types(domain_file)
    # print(f"Types: {types}")

    predicates = parse_predicates(domain_file)
    unary_predicates = [f"{predicate} ({predicate_dict['args'][0]}) {predicate_dict['comment']}" for predicate, predicate_dict in predicates.items() if len(predicate_dict['args']) == 1]
    binary_predicates = [f"{predicate} ({predicate_dict['args'][0]}, {predicate_dict['args'][1]}) {predicate_dict['comment']}" for predicate, predicate_dict in predicates.items() if len(predicate_dict['args']) == 2]
    # print(f"Predicates: {predicates}")
        
    prompt = f"""
    The image of the scene has been provided.
    You must first generate a scene graph for the image, using the types and predicates in the domain file.
    Then use the scene graph to generate the PDDL problem.
    Do not generate anything after the PDDL problem.
    
    Important: When listing objects, provide descriptive names that include relevant visual characteristics that would help identify them in the image. Use specific, descriptive object names rather than abstract or generic terms.
    
    Format:
    Scene graph:
    """

    for obj_type in types:
        prompt += f"{obj_type}: describe all objects of this type in the image.\n"
    for predicate in unary_predicates:
        prompt += f"{predicate}: describe all tuples (predicate, object) that satisfy the predicate.\n"
    for predicate in binary_predicates:
        prompt += f"{predicate}: describe all tuples (predicate, object1, object2...) that satisfy the predicate.\n"

    prompt += f"""
    PDDL problem: <PDDL problem>
    """

    return prompt

def build_refine_problem_prompt(target, config, generate_caption=False, generate_scene_graph=False, enable_caption=False):
    prompt = build_problem_prompt(target, config, add_examples=False, generate_caption=generate_caption, generate_scene_graph=generate_scene_graph, enable_caption=enable_caption)

    prompt += f"""
    **********

    The following is the response you generated last time:
    {target["response"]}

    The following is the error in the PDDL file you made last time:
    {target["error"]}

    Please first analyze where the error is, ie. is it a PDDL semantic error, or an error in the caption or scene graph?
    After analyzing the error, generate all the output again.
    """
    
    return prompt

def build_observation_prompt(target, config):
    new_line = '\n'
    type_dict, _ = parse_types(target['domain'])
    types_list = list(type_dict.keys())
    
    prompt = f"""You are given some images which contain various objects of interests for a given task.

    The following domain file specifies all possible states and actions for the task:
    {target["domain"]}

    Identify all objects relevant to the task instruction in the images that belong to a certain type in the domain file.
    The types are listed below:
    {new_line.join(types_list)}
    
    IMPORTANT INSTRUCTIONS:
    - Only list objects that are visible in the images
    - Only list objects that are relevant to the task instruction
    - If no objects of a type are visible, leave it empty
    - Do NOT write explanations like "no agent is visible in the provided images"
    - Use this exact format for each object: 
        <object_name> - <type>
        <object_name> - <type>
        ...
    - The type should be the most specific subtype that the object belongs to.
  
    The images have been provided. {config.get("text", "") if config else ""}
    The task instruction is: {target["instruction"]}
    
    Now identify all the objects and their respective types:
    """
    return prompt

def build_goal_prompt(target, config, object_states, init_states):
    prompt = f"""
    You are given some images which contain various objects of interests for a given task.
    The images have been provided. {config.get("text", "")}
    The task instruction is: {target["instruction"]}

    The following domain file specifies all possible states and actions for the task:
    {target["domain"]}

    The following are all the objects and their states:
    {object_states}
    The following are all the initial states:
    {init_states}

    For the task instruction, {target["instruction"]}, generate the goal specification for the PDDL file.
    The goal specification should be in the following format:
    (:goal (and 
        (predicate arg1 arg2)
        (predicate arg)
        ...
      )
    )
    """

    return prompt

def build_plan_prompt(target, config, generate_caption=False, generate_scene_graph=False):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate a step-by-step plan for the robot(s).
    All the possible actions and their arguments are given below:
    {config["actions"]}

    You must first reason what objects are in the scene that can be the arguments of the actions.
    Then you must reason what actions to take in the plan. Be mindful of the preconditions and effects of the actions.
    Each action should take one line in the plan.
    The plan should be in the following format:
    (action1 arg1 arg2 arg3)
    (action2 arg1 arg2 arg3)
    ...
    """

    prompt += f"""
    For the current domain,
    {config.get("text", "")}
    """

    if generate_caption:
        prompt += f"""
        The image of the scene has been provided.
        You must first generate a caption for the image.
        Then use the caption to generate the plan.
        Format:
        Caption: <caption>
        Plan: <plan>
        """
    elif generate_scene_graph:
        prompt += f"""
        The image of the scene has been provided.
        You must first generate a scene graph for the image.
        Then use the scene graph to generate the plan.
        Format:
        Scene graph:
        - Object: <object> Property: <property>
        - Object: <object> Property: <property>
        - Relation: <object> <relation> <object>
        - ...
        Plan: <plan>
        """
    else:
        prompt += f"""
        The image of the scene has been provided.
        Please first analyze the image and then generate the plan.
        Do not generate anything after the plan.
        """

    prompt += f"""
    Instruction: {target["instruction"]}
    Please generate the plan for the robot. Do not generate anything after the plan.
    """

    return prompt