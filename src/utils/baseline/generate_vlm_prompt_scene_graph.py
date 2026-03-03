import os
import sys
import numpy as np

import itertools

from ..build_prompts import (
    build_goal_prompt,
    build_observation_prompt,
)
from ..parse_response import (
    parse_block,
    parse_objects,
    parse_predicates,
    parse_types,
    assemble_grounded_predicates,
    assemble_object_states,
    assemble_pddl,
)


def _format_relation_text(predicate_name, predicate_args, bound_args, comment):
    if comment and ("{x" in comment or "{y" in comment):
        try:
            if len(predicate_args) == 1:
                return comment.format(x=f"{predicate_args[0]} {bound_args[0]}")
            if len(predicate_args) == 2:
                return comment.format(
                    x=f"{predicate_args[0]} {bound_args[0]}",
                    y=f"{predicate_args[1]} {bound_args[1]}",
                )
        except Exception:
            pass

    if len(bound_args) == 1:
        return f"predicate ({predicate_name} {bound_args[0]}) is true in the scene"
    if len(bound_args) == 2:
        return (
            f"predicate ({predicate_name} {bound_args[0]} {bound_args[1]}) "
            "is true in the scene"
        )
    return f"predicate {predicate_name} with args {bound_args} is true in the scene"


def _extract_type_hierarchy(type_entries):
    hierarchy = {}
    for entry in type_entries:
        if "(" in entry and entry.endswith(")"):
            child = entry.split("(", 1)[0].strip()
            parent = entry.split("(", 1)[1][:-1].strip()
            if child and parent:
                hierarchy[child] = parent
    return hierarchy

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
    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)

    # Inject a default agent/robot object when the model omits it.
    for type_name in object_types:
        canonical = type_name.split("(", 1)[0].strip()
        if canonical.lower() in {"agent", "robot"} and not objects.get(canonical):
            objects[canonical].append(f"{canonical.lower()}1")

    # If an object appears in both a subtype and its parent, keep the subtype only.
    hierarchy = _extract_type_hierarchy(object_types)
    for child_type, parent_type in hierarchy.items():
        child_objects = objects.get(child_type, [])
        parent_objects = objects.get(parent_type, [])
        if child_objects and parent_objects:
            child_set = set(child_objects)
            objects[parent_type] = [obj for obj in parent_objects if obj not in child_set]

    object_states = assemble_object_states(objects)

    print("---------------objects--------------")
    print(objects)

    predicates = parse_predicates(target["domain"])
    # Build all possible predicates
    all_grounded_predicates = []
    all_predicate_strs = []
    for predicate_name, predicate_info in predicates.items():
        predicate_args = predicate_info["args"]
        comment = predicate_info.get("comment", "")

        if len(predicate_args) == 1:  # unary relation
            typed_objects = objects.get(predicate_args[0], [])
            all_grounded_predicates.extend([
                {"name": predicate_name, "args": [obj]} for obj in typed_objects
            ])

            for obj in typed_objects:
                all_predicate_strs.append(
                    _format_relation_text(
                        predicate_name,
                        predicate_args,
                        [obj],
                        comment,
                    )
                )
        
        elif len(predicate_args) == 2:  # binary relation
            type_1, type_2 = predicate_args
            type_1_objects = objects.get(type_1, [])
            type_2_objects = objects.get(type_2, [])
            for obj1, obj2 in itertools.product(type_1_objects, type_2_objects):
                if obj1 != obj2:
                    all_grounded_predicates.append({
                        "name": predicate_name,
                        "args": [obj1, obj2]
                    })
                    all_predicate_strs.append(
                        _format_relation_text(
                            predicate_name,
                            predicate_args,
                            [obj1, obj2],
                            comment,
                        )
                    )

        # TODO: add support for arbitrary num of args
        else:
            raise NotImplementedError("Only unary and binary relations are supported")
    step2_time = time.time() - step2_start
    print(f"⏱️  Step 2 (Grounded Predicates): {step2_time:.2f}s")

    print("--------------grounded predicates---------------")
    print(all_grounded_predicates)
    
    relation_prompt_template = "Is it true that {relation}? Answer with yes or no."
    relation_prompts = list(map(
        lambda x: relation_prompt_template.format(relation=x), all_predicate_strs
    ))

    print("----------relation prompts------------")
    print(relation_prompts)
    
    # Step 3: Verify relationships with VLM
    step3_start = time.time()
    relation_preds = []

    if len(relation_prompts) > 0:
        if batch_relations:
            # Process all relations at once
            relation_preds = _process_batch_relations(
                model, relation_prompts, observations
            )
        else:
            # Process relations one by one
            relation_preds = _process_individual_relations(
                model, relation_prompts, observations
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

    goal_response = model.generate(goal_prompt, observations)

    # print("--------------------------------")
    # print(goal_response)    

    parsed_goal = parse_block(goal_response, "(:goal", save_header=True)
    if parsed_goal:
        goal_states = f"    {parsed_goal}"
    else:
        goal_states = "    (:goal (and))"

    # print("--------------------------------")
    # print(goal_states)
    
    step4_time = time.time() - step4_start
    print(f"⏱️  Step 4 (Goal Generation): {step4_time:.2f}s")

    # Step 5: Assemble final PDDL file
    step5_start = time.time()
    pddl_file = assemble_pddl(object_states, init_states, goal_states, target["domain"])

    # print("--------------------------------")
    # print(pddl_file)
    
    step5_time = time.time() - step5_start
    print(f"⏱️  Step 5 (PDDL Assembly): {step5_time:.2f}s")

    # Print total time
    total_time = time.time() - start_time
    print(f"⏱️  Total execution time: {total_time:.2f}s")

    all_prompts = observation_prompt + "\n\n" + goal_prompt
            
    return pddl_file, pddl_file, all_prompts


def _process_batch_relations(model, relation_prompts, observations):
    """Process all relations at once in a single VLM call."""
    # Create a single prompt with all relationships
    combined_prompt = "Answer 'yes' or 'no' for each of the following statements:\n\n"
    for i, prompt in enumerate(relation_prompts):
        combined_prompt += f"{i+1}. {prompt}\n"
    
    combined_prompt += "\nProvide your answers in order, one per line, using only 'yes' or 'no'."
    
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


def _process_individual_relations(model, relation_prompts, observations):
    """Process each relation individually with separate VLM calls."""
    relation_preds = []
    
    print("----------Processing relations individually------------")
    for i, prompt in enumerate(relation_prompts):
        # Create individual prompt
        individual_prompt = f"{prompt}\nAnswer with only 'yes' or 'no'."
        
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
