"""Build prompts for different tasks."""

from parsers import parse_types, parse_predicates

def build_problem_prompt(target, domain_name, config, add_examples=True, generate_caption=False, generate_scene_graph=False):
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
    For the current domain, {domain_name}, this is the domain file:
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
    else:
        prompt += f"""
        The image of the scene has been provided.
        Please first analyze the image and then generate the PDDL problem.
        """

    prompt += f"""
    {config.get("text", "")}
    Instruction: {target["instruction"]}
    """
    
    return prompt

def build_scene_graph_template(domain_file):
    types = parse_types(domain_file)
    # print(f"Types: {types}")

    predicates = parse_predicates(domain_file)
    unary_predicates = [f"{predicate} ({args[0]})" for predicate, args in predicates.items() if len(args) == 1]
    binary_predicates = [f"{predicate} ({args[0]}, {args[1]})" for predicate, args in predicates.items() if len(args) == 2]
    # print(f"Predicates: {predicates}")
        
    prompt = f"""
    The image of the scene has been provided.
    You must first generate a scene graph for the image, using the types and predicates in the domain file.
    Then use the scene graph to generate the PDDL problem.
    Do not generate anything after the PDDL problem.
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

def build_refine_problem_prompt(target, domain_name, config, generate_caption=False, generate_scene_graph=False):
    prompt = build_problem_prompt(target, domain_name, config, add_examples=False, generate_caption=generate_caption, generate_scene_graph=generate_scene_graph)

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

def build_domain_prompt(target, domain_name, config, add_examples=True, generate_caption=False, generate_scene_graph=False):
    prompt = f"""
    You are helping a robotic planning task. 
    Given the image of a scene and an instruction, generate the PDDL domain file which contains object types, predicates, and actions suitable for the instruction.
    You will be given all possible actions of the robot along with the arguments of the actions.
    You will reason step by step to complete the action definitions by adding precondtions and effects, and also complete the object types and predicates.
    Format:
    Actions:
    - Action name: <action name>
    - Summarized action: <summarized action>
    - Preconditions: <preconditions>
    - Effects: <effects>
    - Entities: <entities>
    PDDL domain: <PDDL domain>
    """

    example_prompt = f"""Examples of PDDL domains given a different domain instruction:
    Domain: hanoi
    Instruction: Move all disks to the rightmost peg while keeping a rule that larger disks are below.
    All possible actions:
    (action move ?disc ?from ?to)

    Actions:
    - Action name: move
    - Summarized action: The action moves a disc on the top of a peg to another peg that is clear of discs.
    - Preconditions: The action requires the disc and the destination peg to be clear.
    - Effects: The action requires the disc to be moved to the destination peg, and the source peg to be cleared.
    - Entities:
        - Disc: before - on source peg, after - on destination peg
        - Source peg: before - not clear, after - clear
        - Destination peg: before - clear, after - not clear
    
    PDDL domain:
    (define (domain hanoi)
        (:requirements :strips)
        (:predicates
            (clear ?x)
            (on ?x ?y)
            (smaller ?x ?y)
            (move ?disc ?to)
        )
        (:action move
            :parameters (?disc ?from ?to)
            :precondition (and (smaller ?to ?disc) (on ?disc ?from)
                        (clear ?disc) (clear ?to))
            :effect  (and (clear ?from) (on ?disc ?to) (not (on ?disc ?from))
                    (not (clear ?to)))
        )
    )
    """

    if add_examples:
        prompt += example_prompt

    prompt += f"""
    For the current domain, {domain_name}
    """

    if generate_caption:
        prompt += f"""
        The image of the scene has been provided.
        You must first generate a caption for the image.
        Then use the caption to generate the PDDL domain file.
        Format:
        Caption: <caption>
        Actions: <actions>
        PDDL domain: <PDDL domain>
        """
    elif generate_scene_graph:
        # TODO: fix circular dependency
        prompt += f"""
        The image of the scene has been provided.
        You must first generate a scene graph for the image.
        Then use the scene graph to generate the PDDL domain file.
        Format:
        Scene graph:
        - Object: <object> Type: <type in domain file> Property: <predicate in domain file>
        - Object: <object> Type: <type in domain file> Property: <predicate in domain file>
        - Relation: <object> <relation in domain file> <object>
        - ...
        PDDL domain: <PDDL domain>
        """
    else:
        prompt += f"""
        The image of the scene has been provided.
        Please first analyze the image and then generate the PDDL domain file.
        """

    prompt += f"""
    Instruction: {target["instruction"]}
    {config.get("text", "")}

    All possible actions that should be included in the domain file:
    {config["actions"]}

    Do not generate anything after the PDDL domain file.
    """

    return prompt

def build_refine_domain_prompt(target, domain_name, config,  generate_caption=False, generate_scene_graph=False):
    prompt = build_domain_prompt(target, domain_name, config, add_examples=False, generate_caption=generate_caption, generate_scene_graph=generate_scene_graph)

    prompt += f"""
    The following is the PDDL domain file you generated last time:
    {target["domain"]}

    The following is the PDDL problem file you generated last time:
    {target["problem"]}

    The following is the error you made last time:
    {target["error"]}

    Please first analyze where the error is.
    If the error is due to the domain file, please generate the PDDL domain file based on the error.
    If the error is not due to the domain file, explain why it is not, and don't generate any PDDL domain file.
    """

    return prompt

def build_plan_prompt(target, domain_name, config, generate_caption=False, generate_scene_graph=False):
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
    For the current domain, {domain_name},
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