from typing import List, Dict
import os
import json
import traceback
from set_up_alfred import (
    ALFREDEnvironment, 
    get_full_observations,
    save_image,
    SimplePDDLMapper
)


def get_action_sequence(plan: str, object_mapping: dict) -> List[Dict]:
    object_names = [v["object_name"] for v in object_mapping.values()]
    object_names_lower_set = {name.lower(): name for name in object_names}
    
    action_sequences = plan.split("\n")
    res = []
    for action_sequence in action_sequences:
        action_sequence = action_sequence[1:-1]
        action_sequence = action_sequence.split(" ")
        args = []
        for arg in action_sequence[1:]:
            original_arg = object_names_lower_set.get(arg.lower(), arg)
            args.append(original_arg)
        res.append({
            "name": action_sequence[0],
            "args": args
        })
    return res

if __name__ == "__main__":
    task_id = "pick_and_place_simple-BaseballBat-None-Bed-326-train"

    solution_dir = "/home/mh3897/pddl/villain/scripts/alfred/test-pick_and_place_simple-BaseballBat-None-Bed-326" # contain problem.pddl, plan.txt, objects.json, traj_data.json

    with open(os.path.join(solution_dir, "plan.txt"), "r") as f:
        plan = f.read()

    with open(os.path.join(solution_dir, "objects.json"), "r") as f:
        object_mapping = json.load(f)

    action_sequence = get_action_sequence(plan, object_mapping)
    # print(action_sequence)

    env = ALFREDEnvironment()
    if env.load_task_by_id(task_id):
        print("Load task successfully")
    else:
        print("Load task failed")
        exit()

    observations, objects = get_full_observations(env, num_images=8, look_down_angle=15)
    for i, image in enumerate(observations):
        # image type
        save_image(image, f"{solution_dir}/images/image_start_{i}.png")

    mapper = SimplePDDLMapper(env, object_mapping)
    for i, action in enumerate(action_sequence):
        try:
            print(f"Action {i}: {action}")
            result = mapper.execute_pddl_action(action)
            if not result["success"]:
                for obj in objects:
                    if obj["objectId"].startswith("Bed"):
                        print("\n\n")
                        print(obj)
                        print("\n\n")
            print(f"Executed result {i}: {result}")
            observation = env.get_current_observation()
            objects = observation["objects"]
            save_image(observation["image"], f"{solution_dir}/images/image_action_{i}.png")
        except Exception as e:
            print(f"Error executing action {action}: {traceback.format_exc()}")
            break