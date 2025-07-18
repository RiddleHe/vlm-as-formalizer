from ..build_prompts import build_observation_prompt
from ..parse_response import parse_types, parse_objects, parse_predicates, parse_block
from ..parse_response import assemble_object_states, assemble_grounded_predicates, assemble_pddl
from ..build_prompts import build_goal_prompt
from ..models import predict_relation_probs

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

    # print("--------------------------------")
    # print(object_response)

    object_types = parse_types(target["domain"])
    objects = parse_objects(object_response, object_types)

    object_states = assemble_object_states(objects)

    # print("--------------------------------")
    # print(objects)

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

    # print("--------------------------------")
    # print(all_grounded_predicates)

    # print("--------------------------------")
    # print(all_predicate_strs)
        
    relation_prompt_template = "Is {relation} (Answer only yes/no)"
    relation_prompts = list(map(
        lambda x: relation_prompt_template.format(relation=x), all_predicate_strs
    ))

    # print("--------------------------------")
    # print(relation_prompts)

    # batch the prompts
    batch_size = 8
    relation_prompts_batched = [
        relation_prompts[i:i+batch_size]
        for i in range(0, len(relation_prompts), batch_size)
    ]

    relation_preds = []
    for batch in relation_prompts_batched:
        relation_preds.extend(predict_relation_probs(model, batch, observations, past_key_values))

    # print("--------------------------------")
    # print(relation_preds)

    true_grounded_predicates = [
        pred for pred, is_true in zip(all_grounded_predicates, relation_preds) if is_true
    ]

    print("--------------------------------")
    print(true_grounded_predicates)

    init_states = assemble_grounded_predicates(true_grounded_predicates)

    # print("--------------------------------")
    # print(object_states)
    # print(init_states)

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