import itertools
import os

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
from .sgclip import predict_all_relations, setup_and_load_models
from .helpers import observations_to_images, extract_relation_types, convert_sgclip_to_relation_preds

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

def extract_detectable_object_classes(domain_file, objects):
    """
    Automatically extract detectable object classes from domain types and object instances.
    
    Args:
        domain_file: The PDDL domain file content
        objects: Dictionary mapping object types to object instances
    
    Returns:
        list: List of detectable object classes for computer vision models
    """
    # Parse domain types
    types_raw = parse_types(domain_file)
    
    # Extract base types (remove hierarchy info)
    base_types = []
    for type_entry in types_raw:
        if '(' in type_entry:
            # Extract subtype from "subtype (supertype)" format
            base_type = type_entry.split('(')[0].strip()
        else:
            base_type = type_entry.strip()
        base_types.append(base_type)
    
    # Common synonyms and variants for object types
    type_synonyms = {
        'block': ['block', 'cube', 'brick', 'toy', 'object', 'box'],
        'robot': ['robot', 'arm', 'manipulator'],
        'vegetable': ['vegetable', 'food', 'produce'],
        'tool': ['tool', 'utensil', 'instrument', 'knife'],
        'location': ['location', 'place', 'area', 'surface'],
        'table': ['table', 'surface', 'counter'],
        'disk': ['disk', 'disc', 'ring', 'object'],
        'peg': ['peg', 'rod', 'post', 'stick'],
        'ball': ['ball', 'sphere', 'orb'],
        'cup': ['cup', 'container', 'vessel'],
        'plate': ['plate', 'dish', 'platter'],
        'bowl': ['bowl', 'container', 'dish'],
    }
    
    # Collect all detectable classes
    detectable_classes = []
    
    # Add base types and their synonyms
    for base_type in base_types:
        if base_type in type_synonyms:
            detectable_classes.extend(type_synonyms[base_type])
        else:
            # Fallback: use the type name itself and add "object" as generic
            detectable_classes.extend([base_type, 'object'])
    
    # Add specific object instances as potential classes (useful for named objects)
    for obj_type, obj_instances in objects.items():
        for obj_instance in obj_instances:
            # Extract meaningful parts from object names
            # e.g., "red_cube" -> ["red", "cube"]
            name_parts = obj_instance.replace('_', ' ').split()
            for part in name_parts:
                if len(part) > 2 and part.isalpha():  # Skip short/numeric parts
                    detectable_classes.append(part)
    
    # Remove duplicates while preserving order
    detectable_classes = list(dict.fromkeys(detectable_classes))
    
    return detectable_classes

def generate_multi_step(
    target,
    config,
    model,
    observations,
    retry_idx,
    generate_from_vlm=True,
    generate_from_cv_model=False,
):
    observation_prompt = build_observation_prompt(target, config)
    # print(observation_prompt)
    object_response, past_key_values = model.generate(observation_prompt, observations, return_cache=True)

    print("--------------------------------")
    print(object_response)

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
    unary_relations, binary_relations = extract_relation_types(all_grounded_predicates)
    print("--------------unary relations---------------")
    print(unary_relations)
    print("--------------binary relations---------------")
    print(binary_relations)
    images = observations_to_images(observations)
    
    print("----------predicate strings------------")
    print(all_predicate_strs)
        
    relation_prompt_template = "Is {relation} (Answer only yes/no)"
    relation_prompts = list(map(
        lambda x: relation_prompt_template.format(relation=x), all_predicate_strs
    ))

    print("----------relation prompts------------")
    print(relation_prompts)

    # Use sgclip for relation prediction instead of VLM
    print("----------Using sgclip for relation prediction------------")
    
    # Setup sgclip models
    BASE_DIR = os.path.join(os.path.dirname(__file__), "..", "..")
    DEVICE = "cuda"
    sgclip_models = setup_and_load_models(BASE_DIR, DEVICE, detector_type="yoloe")
    
    # Dynamically extract detectable object classes from domain and objects
    object_classes = extract_detectable_object_classes(target["domain"], objects)
    
    print(f"----------detectable object classes (auto-extracted)------------")
    print(object_classes)
    
    # Use sgclip to predict all relations
    sgclip_results = predict_all_relations(
        images=images,
        object_classes=object_classes,
        unary_relations=unary_relations,
        binary_relations=binary_relations,
        models=sgclip_models,
        detector_type="yoloe",
    )
    
    print("----------sgclip results------------")
    print(sgclip_results)
    
    # Convert sgclip results to relation_preds format with confidence thresholding
    # Lower threshold for more permissive matching, higher threshold for stricter matching
    confidence_threshold = 0.8  # Accept relations with 40%+ confidence
    relation_preds = convert_sgclip_to_relation_preds(
        sgclip_results, 
        all_grounded_predicates, 
        confidence_threshold=confidence_threshold
    )

    print("----------conversion results------------")
    print(f"Total grounded predicates: {len(all_grounded_predicates)}")
    print(f"True predictions: {sum(relation_preds)}")
    print(f"Acceptance rate: {sum(relation_preds)/len(relation_preds)*100:.1f}%")

    true_grounded_predicates = [
        pred for pred, is_true in zip(all_grounded_predicates, relation_preds) if is_true
    ]

    print("----------final true predicates------------")
    print(true_grounded_predicates)

    init_states = assemble_grounded_predicates(true_grounded_predicates)

    print("--------------------------------")
    print(object_states)
    print(init_states)

    goal_prompt = build_goal_prompt(target, config, object_states, init_states)

    # print("--------------------------------")
    # print(goal_prompt)

    goal_response = model.generate(goal_prompt, observations)

    # print("--------------------------------")
    # print(goal_response)    

    goal_states = "    " + parse_block(goal_response, "(:goal", save_header=True)

    # print("--------------------------------")
    # print(goal_states)

    pddl_file = assemble_pddl(object_states, init_states, goal_states, target["domain"])

    # print("--------------------------------")
    # print(pddl_file)

    all_responses = object_response + "\n\n" + goal_response
    all_prompts = observation_prompt + "\n\n" + goal_prompt
            
    return pddl_file, pddl_file, all_prompts
        

