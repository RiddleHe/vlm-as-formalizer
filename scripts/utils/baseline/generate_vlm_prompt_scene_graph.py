import numpy as np

import itertools

from ..build_prompts import (
    build_goal_prompt,
    build_observation_prompt,
)
from ..parse_response import (
    parse_objects, 
    parse_types, 
    parse_predicates, 
    parse_block,
    assemble_object_states,
    assemble_grounded_predicates,
    assemble_pddl,
    parse_pddl,
)

def generate_multi_step_with_vlm(
    target,
    config,
    model,
    observations,
    retry_idx,
    batch_relations=True,  # New parameter: True = all at once, False = one by one
):
    import time
    
    # Start overall timing
    start_time = time.time()
    
    # Step 1: Build observation prompt and generate object response
    step1_start = time.time()
    observation_prompt = build_observation_prompt(target, config)
    # print(observation_prompt)
    object_response= model.generate(observation_prompt, observations)
    step1_time = time.time() - step1_start
    print(f"⏱️  Step 1 (Object Detection): {step1_time:.2f}s")

    print("--------------------------------")
    print(object_response)

    # Step 2: Parse objects and build grounded predicates
    step2_start = time.time()
    object_types, type_to_supertypes = parse_types(target["domain"])
    print(f"Object types: {object_types}\n")

    objects = parse_objects(object_response, type_to_supertypes)
    print(f"Objects: {objects}\n")

    object_states = assemble_object_states(objects)
    print(f"Object states: {object_states}\n")

    print("---------------objects--------------")

    predicates = parse_predicates(target["domain"])
    print(f"Predicates: {predicates}\n")

    # Build all possible predicates
    all_grounded_predicates = []
    all_predicate_strs = []
    for predicate_name, predicate_info in predicates.items():
        predicate_args = predicate_info["args"]
        comment = predicate_info.get("comment", "")

        if len(predicate_args) == 1:  # unary relation
            typed_objects = objects[predicate_args[0]]
            print(f"Predicate: {predicate_name}- Predicate args: {predicate_args} - Typed objects: {typed_objects}\n")
            all_grounded_predicates.extend([
                {"name": predicate_name, "args": [obj]} for obj in typed_objects
            ])

            for obj in typed_objects:
                obj_str = f"{predicate_args[0]} {obj}"
                all_predicate_strs.extend([
                    comment.format(x=obj_str)
                ])
        
        elif len(predicate_args) == 2:  # binary relation
            type_1, type_2 = predicate_args
            type_1_objects, type_2_objects = objects[type_1], objects[type_2]
            print(f"Predicate: {predicate_name}- Predicate args: {predicate_args} - Type 1 objects: {type_1_objects} - Type 2 objects: {type_2_objects}\n")
            for obj1, obj2 in itertools.product(type_1_objects, type_2_objects):
                if obj1 != obj2:
                    all_grounded_predicates.append({
                        "name": predicate_name,
                        "args": [obj1, obj2]
                    })
                    obj1_str = f"{type_1} {obj1}"
                    obj2_str = f"{type_2} {obj2}"
                    all_predicate_strs.append(
                        comment.format(x=obj1_str, y=obj2_str)
                    )

        # TODO: add support for arbitrary num of args
        else:
            raise NotImplementedError("Only unary and binary relations are supported")
    step2_time = time.time() - step2_start
    print(f"⏱️  Step 2 (Grounded Predicates): {step2_time:.2f}s")

    print("--------------grounded predicates---------------")
    print(all_grounded_predicates)

    # Generate prompts directly from grounded predicates
    relation_prompts = []
    for pred in all_grounded_predicates:
        predicate_name = pred['name']
        args = pred['args']
        
        # Get the predicate info to know the types
        predicate_info = predicates[predicate_name]
        arg_types = predicate_info['args']
        comment = predicate_info.get("comment", "")
        comment = f"({comment})"
        
        # Build a natural language question
        if len(args) == 1:
            prompt = f"Is the predicate ({predicate_name} {args[0]}) true of {arg_types[0]} {args[0]} {comment}?"
        elif len(args) == 2:
            prompt = f"Is the predicate ({predicate_name} {args[0]} {args[1]}) true of {arg_types[0]} {args[0]} and {arg_types[1]} {args[1]} {comment}?"
        else:
            # Fallback for more arguments
            arg_strs = [f"{t} {a}" for t, a in zip(arg_types, args)]
            prompt = f"Is {predicate_name} " + " ".join(arg_strs) + "?"
        
        relation_prompts.append(prompt)

    print("----------relation prompts------------")
    print(relation_prompts)
    
    # Step 3: Verify relationships with VLM
    step3_start = time.time()
    relation_preds = []

    if len(relation_prompts) > 0:
        if batch_relations:
            # Process all relations at once
            relation_preds = _process_batch_relations(
                model, relation_prompts, observations, config
            )
        else:
            # Process relations one by one
            relation_preds = _process_individual_relations(
                model, relation_prompts, observations, config
            )

    step3_time = time.time() - step3_start
    print("----------VLM relationship results------------")
    print(f"Total grounded predicates: {len(all_grounded_predicates)}")
    print(f"True predictions: {sum(relation_preds)}")
    if len(relation_preds) > 0:
        print(f"Acceptance rate: {sum(relation_preds)/len(relation_preds)*100:.1f}%")
    print(f"⏱️  Step 3 (VLM Relationship Prediction): {step3_time:.2f}s")
    print(f"Processing mode: {'Batch (all at once)' if batch_relations else 'Individual (one by one)'}")

    true_grounded_predicates = [
        pred for pred, is_true in zip(all_grounded_predicates, relation_preds) if is_true
    ]

    print("----------final true predicates------------")
    print(true_grounded_predicates)

    init_states = assemble_grounded_predicates(true_grounded_predicates)

    print("--------------------------------")
    print(object_states)
    print(init_states)

    # Step 4: Generate goal states
    step4_start = time.time()
    goal_prompt = build_goal_prompt(target, config, object_states, init_states)

    # print("--------------------------------")
    # print(goal_prompt)

    pddl_response = model.generate(goal_prompt, observations)

    print("--------------------------------")
    print(pddl_response)    

    pddl_file = parse_pddl(pddl_response)

    print("--------------------------------")
    print(pddl_file)
    
    step4_time = time.time() - step4_start
    print(f"⏱️  Step 4 (Goal Generation): {step4_time:.2f}s")
    # print(f"Goal states: \n{goal_states}\n")

    # # Step 5: Assemble final PDDL file
    step5_start = time.time()
    # pddl_file = assemble_pddl(object_states, init_states, goal_states, target["domain"])

    # print("--------------------------------")
    # print(pddl_file)
    
    step5_time = time.time() - step5_start
    print(f"⏱️  Step 5 (PDDL Assembly): {step5_time:.2f}s")

    # Print total time
    total_time = time.time() - start_time
    print(f"⏱️  Total execution time: {total_time:.2f}s")

    all_prompts = observation_prompt + "\n\n" + goal_prompt
            
    return pddl_file, pddl_file, all_prompts


def _process_batch_relations(model, relation_prompts, observations, config):
    """Process all relations at once in a single VLM call."""
    # Create a single prompt with all relationships
    combined_prompt = f"{config.get('text', '')}Answer 'yes' or 'no' for each of the following statements:\n\n"
    for i, prompt in enumerate(relation_prompts):
        combined_prompt += f"{i+1}. {prompt}\n"
    
    combined_prompt += "\nProvide your answers in order, one per line, using only 'yes' or 'no'."

    print("----------VLM batch prompt------------")
    print(combined_prompt)
    
    # Send all relationships to VLM at once
    relation_response = model.generate(combined_prompt, observations)
    
    print("----------VLM batch response------------")
    print(relation_response)
    
    # Parse the response to extract yes/no for each relationship
    relation_preds = []
    
    # Split response into lines and process each
    response_lines = relation_response.strip().split('\n')
    
    for line in response_lines:
        line = line.strip().lower()
        # Skip empty lines
        if not line:
            continue
            
        # Extract yes/no from various possible formats
        # Handle formats like "1. yes", "yes", "Yes", "1: no", etc.
        if 'yes' in line:
            relation_preds.append(True)
        elif 'no' in line:
            relation_preds.append(False)
    
    # Validate we got the right number of predictions
    if len(relation_preds) != len(relation_prompts):
        print(f"Warning: Expected {len(relation_prompts)} predictions, got {len(relation_preds)}")
        # If we got fewer predictions, pad with False
        while len(relation_preds) < len(relation_prompts):
            relation_preds.append(False)
        # If we got too many, truncate
        relation_preds = relation_preds[:len(relation_prompts)]
    
    return relation_preds


def _process_individual_relations(model, relation_prompts, observations, config):
    """Process each relation individually with separate VLM calls."""
    relation_preds = []
    
    print("----------Processing relations individually------------")
    for i, prompt in enumerate(relation_prompts):
        # Create individual prompt
        individual_prompt = f"{config.get('text', '')}{prompt}\nAnswer with only 'yes' or 'no'."
        
        # Get response for this single relation
        response = model.generate(individual_prompt, observations)
        
        # Parse individual response
        response_lower = response.strip().lower()
        if 'yes' in response_lower:
            relation_preds.append(True)
            print(f"  {i+1}/{len(relation_prompts)}: {prompt} -> YES")
        elif 'no' in response_lower:
            relation_preds.append(False)
            print(f"  {i+1}/{len(relation_prompts)}: {prompt} -> NO")
        else:
            # Default to False if unclear
            relation_preds.append(False)
            print(f"  {i+1}/{len(relation_prompts)}: {prompt} -> NO (unclear response: {response})")
    
    return relation_preds