
import itertools
import os
import sys

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
from ..helpers import observations_to_images, extract_relation_types, convert_sgclip_to_relation_preds

def generate_multi_step_with_sgclip_vlm(
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
    import os
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
        detector_type="dino",
    )

    print("----------sgclip results------------")
    print(sgclip_results)

    # Save visualization images with bounding boxes to organized directory
    from datetime import datetime
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Lower threshold for more permissive matching, higher threshold for stricter matching
    confidence_threshold = 0.3  # Accept relations with 30%+ confidence for more coverage
    
    # Get batch data from sgclip models for color analysis
    batch_data = None
    try:
        # We need to run object detection again to get batch data for color analysis
        # This is a bit inefficient but necessary for accurate color mapping
        
        # Import the mask generation function we need
        import importlib.util
        
        # Path to the mask generation module
        inference_path = "/home/mh3897/pddl/villain/LASER/src/visualization"
        mask_gen_path = os.path.join(inference_path, "mask_generation_grounding_dino.py")
        
        # Save original sys.path
        original_path = sys.path[:]
        
        try:
            # Import the correct utils module from LASER
            laser_utils_path = os.path.join(inference_path, "utils.py")
            laser_utils_spec = importlib.util.spec_from_file_location("laser_utils", laser_utils_path)
            laser_utils = importlib.util.module_from_spec(laser_utils_spec)
            laser_utils_spec.loader.exec_module(laser_utils)
            
            # Temporarily replace utils in sys.modules
            original_utils = sys.modules.get('utils', None)
            sys.modules['utils'] = laser_utils
            
            # Clean sys.path and add necessary paths
            minimal_path = [
                inference_path,
                "/local-ssd/custom_models/GroundingDINO/",
            ]
            # Add back essential system paths
            for path in original_path:
                if ('site-packages' in path or 'conda' in path or 'python' in path or 
                    'lib' in path or not path or path.startswith('/usr')):
                    minimal_path.append(path)
            
            sys.path = minimal_path
            
            # Import the module directly
            spec = importlib.util.spec_from_file_location("mask_generation_grounding_dino", mask_gen_path)
            mask_gen_module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mask_gen_module)
            
            # Get the YOLOE function
            generate_masks_yoloe = mask_gen_module.generate_masks_yoloe
            
            # Now get batch data
            classes_ls = get_classes_ls(object_classes)
            batch_data = get_batched_objects(
                images=images,
                classes_ls=classes_ls,
                grounding_model=sgclip_models["grounding_model"],
                sam_video_predictor=sgclip_models["sam_video_predictor"],
                mask_generator=sgclip_models["mask_generator"],
                generate_masks=generate_masks_yoloe,
                detector_type="yoloe",
                device=sgclip_models["device"]
            )
            
        finally:
            # Restore original utils modules
            if original_utils is not None:
                sys.modules['utils'] = original_utils
            elif 'utils' in sys.modules:
                del sys.modules['utils']
            
            # Restore original sys.path
            sys.path = original_path
            
    except Exception as e:
        print(f"⚠️ Failed to get batch data for color analysis: {e}")
    
    relation_preds = convert_sgclip_to_relation_preds(
        sgclip_results, 
        all_grounded_predicates, 
        confidence_threshold=confidence_threshold,
        images=images,
        batch=batch_data
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