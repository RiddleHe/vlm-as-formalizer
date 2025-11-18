from typing import List, Dict
import os
import json
import traceback
from set_up_alfred import (
    ALFREDEnvironment, 
    save_image,
)
import numpy as np
import sys
from tqdm.auto import tqdm

def get_task_id(task_dir):
    task_id_complete = task_dir.split("/")[-1]
    task_id_env = task_id_complete.split("_trial_")[0]

    data_split = "train"
    task_id = task_id_env + "-" + data_split

    return task_id

def get_full_observations(alfred_env, object_mapping, num_images=6, look_down_angle=15):
    observations = []
    visited_locs = []
    visited_horizons = []
    agent_height = alfred_env.get_current_observation()["agent"]["position"]["y"]
    # We explciitly don't scan the room because there are duplicate objects

    for env_object in object_mapping.keys():
        skipped = False
        object_stats = object_mapping[env_object]
        object_name, object_loc = object_stats["object_name"], object_stats["location"]

        x, z, rotation, horizon = object_loc.split("|")[1:]

        offsets = [(0, 0), (0.25, 0), (-0.25, 0), (0, 0.25), (0, -0.25)]
        success = False
        for off_x, off_z in offsets:
            loc_x = int(x) * 0.25 + off_x
            loc_z = int(z) * 0.25 + off_z
            loc_rotation = int(rotation) * 90
            loc_horizon = int(horizon)

            # Deduplicate
            current_loc = np.array([loc_x, loc_z])

            if len(visited_locs) > 0:
                visited_locs_array = np.array(visited_locs)
                visited_horizons_array = np.array(visited_horizons)

                distances = np.linalg.norm(visited_locs_array - current_loc, axis=1)
                close_mask = distances < 0.1
                if np.any(close_mask):
                    close_horizons = visited_horizons_array[close_mask]
                    horizon_diffs = np.abs(close_horizons - loc_horizon)
                    if np.any(horizon_diffs < 15):
                        print(f"Skipping {object_name} because it's too close to a previously visited location")
                        skipped = True
                        break

            action = {
                "action": "TeleportFull",
                "x": loc_x,
                "y": agent_height,
                "z": loc_z,
                "rotateOnTeleport": True,
                "rotation": loc_rotation,
                "horizon": loc_horizon,
            }
            result = alfred_env.execute_action(action)
            if result["success"]:
                observation = alfred_env.get_current_observation()
                observations.append({
                    "image": observation["image"],
                    "name": f"{object_name}.png",
                })
                success = True
                visited_locs.append(current_loc)
                visited_horizons.append(loc_horizon)
                break

        if not success:
            print(f"Failed to teleport to {object_name}")

    return observations

def get_images(task_dir, env):
    task_id = get_task_id(task_dir)

    with open(os.path.join(task_dir, "objects.json"), "r") as f:
        object_mapping = json.load(f)

    if env.load_task_by_id(task_id):
        observations = get_full_observations(env, object_mapping)
        
        os.makedirs(os.path.join(task_dir, "observations"), exist_ok=True)
        for i, obs in enumerate(observations):
            image = obs["image"]
            name = obs["name"]
            save_image(image, os.path.join(task_dir, "observations", name))

    else:
        raise ValueError(f"Task {task_id} not found")

def get_images_for_all_tasks(root_dir="/local-ssd/alfred/alfred_train_cleaned"):
    env = ALFREDEnvironment()

    problem_dirs = []

    for task_dir in tqdm(sorted(os.listdir(root_dir))):
        task_dir_path = os.path.join(root_dir, task_dir)
        if os.path.isdir(task_dir_path):
            try:
                get_images(task_dir_path, env)
            except Exception as e:
                problem_dirs.append(
                    {"dir": task_dir_path, "error": traceback.format_exc()}
                )

    with open("alfred_problem_dirs.json", "w") as f:
        json.dump(problem_dirs, f)

if __name__ == "__main__":
    if sys.argv[1] == "test":
        env = ALFREDEnvironment()
        get_images("/pddl/villain/scripts/alfred/look_at_obj_in_light-AlarmClock-None-DeskLamp-302_trial_T20190908_192756_298295", env)
    elif sys.argv[1] == "dev":
        get_images_for_all_tasks()