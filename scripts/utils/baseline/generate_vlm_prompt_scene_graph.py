import os
import sys
import numpy as np

from ..build_prompts import (
    build_problem_prompt, 
    build_refine_problem_prompt, 
    build_goal_prompt,
    build_plan_prompt,
    build_observation_prompt,
)
from ..parse_response import (
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
from ..checkers import check_error
from ..models import predict_relation_probs
from ..sgclip import predict_all_relations, setup_and_load_models, get_classes_ls, get_batched_objects
from ..helpers import observations_to_images, extract_relation_types

def generate_multi_step_with_vlm(
    target,
    config,
    model,
    observations,
    retry_idx,
):
    import time
    
    # Start overall timing
    start_time = time.time()
    
    # Step 1: Build observation prompt and generate object response
    step1_start = time.time()
    observation_prompt = build_observation_prompt(target, config)
    # print(observation_prompt)
    object_response, past_key_values = model.generate(observation_prompt, observations, return_cache=True)
    step1_time = time.time() - step1_start
    print(f"⏱️  Step 1 (Object Detection): {step1_time:.2f}s")

    print("--------------------------------")
    print(object_response)

    # Step 2: Parse objects and build grounded predicates
    step2_start = time.time()
    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)

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
            typed_objects = objects[predicate_args[0]]
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

    print("--------------grounded predicates---------------")
    print(all_grounded_predicates)
    
    step2_time = time.time() - step2_start
    print(f"⏱️  Step 2 (Parsing & Building Predicates): {step2_time:.2f}s")
    
    # Step 3: Use Moondream for relationship prediction
    step3_start = time.time()
    print("----------Using Moondream for relationship prediction------------")
    
    # Initialize Moondream
    import moondream as md
    from PIL import Image
    
    # Initialize Moondream Cloud (replace with your API key)
    moondream_model = md.vl(api_key="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXlfaWQiOiJjMjczYmFiZS02NjY2LTQwOTktOTM2My1jZTdlY2RiY2M5YWMiLCJvcmdfaWQiOiJRaWxrSHhONUxhZ0N4N3lTUWdJTU5TeG1NOWVDdmFUUyIsImlhdCI6MTc1MjQ0NzA0MywidmVyIjoxfQ.YcYPiPVaullvInexObYKCyc1sO-57YLvy9SjSTTbfhY")  # Replace with your actual API key
    
    # Convert observations to PIL Images for Moondream
    moondream_images = []
    for obs_path in observations:
        if isinstance(obs_path, str):
            # If it's a file path
            img = Image.open(obs_path)
        else:
            # If it's already an image object
            img = obs_path
        moondream_images.append(img)
    
    relation_preds = []
    for idx, predicate in enumerate(all_grounded_predicates):
        predicate_start = time.time()
        
        # Create VLM prompt for this specific relationship with explicit spatial descriptions
        if len(predicate["args"]) == 1:
            # Unary relation
            obj_name = predicate["args"][0]
            predicate_name = predicate["name"]
            
            # Use explicit spatial descriptions for better VLM understanding
            if predicate_name == "ontable":
                relation_query = f"Is {obj_name} directly touching the table surface? Answer only yes or no."
            elif predicate_name == "clear":
                relation_query = f"Is {obj_name} clear? nothing is stacked on it. Answer only yes or no."
            elif predicate_name == "handempty":
                relation_query = f"Is {obj_name} holding nothing? Answer only yes or no."
            elif predicate_name == "handfull":
                relation_query = f"Is {obj_name} holding something? Answer only yes or no."
            elif predicate_name == "holding":
                relation_query = f"Is {obj_name} being held by a robot?  Answer only yes or no."
            else:
                # Find corresponding comment/description for other predicates
                predicate_info = predicates[predicate_name]
                comment = predicate_info.get("comment", "")
                
                if comment:
                    obj_str = f"{predicate_info['args'][0]} {obj_name}"
                    relation_query = comment.format(x=obj_str) + " Answer only yes or no."
                else:
                    relation_query = f"Is {obj_name} {predicate_name}? Answer only yes or no."
                
        elif len(predicate["args"]) == 2:
            # Binary relation
            obj1, obj2 = predicate["args"]
            predicate_name = predicate["name"]
            
            # Use explicit spatial descriptions for better VLM understanding
            if predicate_name == "on":
                relation_query = f"Is {obj1}  on top of {obj2}? Answer only yes or no."
            else:
                # Find corresponding comment/description for other predicates
                predicate_info = predicates[predicate_name]
                comment = predicate_info.get("comment", "")
                
                if comment:
                    type_1, type_2 = predicate_info["args"]
                    obj1_str = f"{type_1} {obj1}"
                    obj2_str = f"{type_2} {obj2}"
                    relation_query = comment.format(x=obj1_str, y=obj2_str) + " Answer only yes or no."
                else:
                    relation_query = f"Is {obj1} {predicate_name} {obj2}? Answer only yes or no."
        
        # Query Moondream for this relationship (use first image for now)
        try:
            moondream_response = moondream_model.query(moondream_images[0], relation_query)["answer"]
        except Exception as e:
            print(f"Error querying Moondream: {e}")
            moondream_response = "no"  # Default to no on error
        
        # Parse Moondream response
        is_true = "yes" in moondream_response.lower() and "no" not in moondream_response.lower()
        relation_preds.append(is_true)
        
        predicate_time = time.time() - predicate_start
        print(f"Query [{idx+1}/{len(all_grounded_predicates)}]: {relation_query}")
        print(f"Moondream Response: {moondream_response}")
        print(f"Parsed as: {is_true} (⏱️ {predicate_time:.2f}s)")
        print("---")
    
    step3_time = time.time() - step3_start
    print("----------VLM relationship results------------")
    print(f"Total grounded predicates: {len(all_grounded_predicates)}")
    print(f"True predictions: {sum(relation_preds)}")
    print(f"Acceptance rate: {sum(relation_preds)/len(relation_preds)*100:.1f}%")
    print(f"⏱️  Step 3 (VLM Relationship Prediction): {step3_time:.2f}s")

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

    goal_states = "    " + parse_block(goal_response, "(:goal", save_header=True)

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

   
    all_responses = object_response + "\n\n" + goal_response
    all_prompts = observation_prompt + "\n\n" + goal_prompt
            
    return pddl_file, pddl_file, all_prompts
        

