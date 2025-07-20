#!/usr/bin/env python3
"""
1. task id mapping
2. realtime observation
3. agent control
"""

import json
import os
import glob
from typing import Dict, List, Optional, Tuple
import numpy as np
import cv2
from pathlib import Path
import numpy as np

class ALFREDTaskManager:
    """
    ALFRED task manager, mapping task id to task path
    """
    
    def __init__(self, data_path: str = "/local-ssd/alfred/full_2.1.0"):
        self.data_path = data_path
        self.json_feat_path = os.path.join(data_path, "json_feat_2.1.0")
        self.task_id_mapping = {}
        self.build_task_mapping()
        
    def build_task_mapping(self):
        """build task id mapping"""
        print("Building task ID mapping...")
        
        # train, valid_seen, valid_unseen, tests_seen, tests_unseen
        for split in ["train", "valid_seen", "valid_unseen", "tests_seen", "tests_unseen"]:
            split_path = os.path.join(self.json_feat_path, split)
            if not os.path.exists(split_path):
                continue
                
            for task_dir in os.listdir(split_path):
                task_path = os.path.join(split_path, task_dir)
                if not os.path.isdir(task_path):
                    continue
                    
                # task_type-object-receptacle-scene
                parts = task_dir.split('-')
                if len(parts) >= 4:
                    task_type = parts[0]
                    object_type = parts[1]
                    receptacle_1_type = parts[2] # None if only one receptacle
                    receptacle_2_type = parts[3]
                    scene_id = parts[4]
                    
                    # get all trials
                    trials = []
                    for trial_dir in os.listdir(task_path):
                        trial_path = os.path.join(task_path, trial_dir)
                        if os.path.isdir(trial_path) and trial_dir.startswith("trial_"):
                            traj_file = os.path.join(trial_path, "traj_data.json")
                            if os.path.exists(traj_file):
                                trials.append(trial_path)
                    
                    if trials:
                        task_id = f"{task_type}-{object_type}-{receptacle_1_type}-{receptacle_2_type}-{scene_id}-{split}"
                        self.task_id_mapping[task_id] = {
                            "task_type": task_type,
                            "object_type": object_type,
                            "receptacle_1_type": receptacle_1_type,
                            "receptacle_2_type": receptacle_2_type,
                            "scene_id": scene_id,
                            "split": split,
                            "trials": trials
                        }
        
        print(f"Found {len(self.task_id_mapping)} tasks")
    
    def get_task_path_from_id(self, task_id: str) -> Optional[str]:
        """get task path from task id"""
        if task_id in self.task_id_mapping:
            return self.task_id_mapping[task_id]["trials"][0] # Only select the first trial since they are similar
        return None
    
    def get_all_task_ids(self) -> List[str]:
        """get all task ids"""
        return list(self.task_id_mapping.keys())
    
    def get_task_info(self, task_id: str) -> Optional[Dict]:
        """get task info"""
        return self.task_id_mapping.get(task_id)

class ALFREDEnvironment:
    """
    ALFRED environment interface, handle environment initialization and interaction
    """
    
    def __init__(self, x_display=':0'):
        self.x_display = x_display
        self.env = None
        self.task = None
        self.current_task_path = None
        self.task_manager = ALFREDTaskManager()
        
        # 初始化环境
        self.init_environment()
    
    def init_environment(self):
        """initialize AI2-THOR environment"""
        import sys
        sys.path.append('/local-ssd/alfred/alfred_env')
        
        from env.thor_env import ThorEnv
        from env.tasks import get_task
        
        # set environment variables
        os.environ['DISPLAY'] = self.x_display
        
        # initialize environment
        self.env = ThorEnv()
        print("✅ ALFRED environment initialized")
    
    def load_task_by_id(self, task_id: str) -> bool:
        """
        load task by task id
        
        Args:
            task_id: task id, format like "look_at_obj_in_light-AlarmClock-None-DeskLamp-301"
            
        Returns:
            whether task is loaded successfully
        """
        task_path = self.task_manager.get_task_path_from_id(task_id)
        if not task_path:
            print(f"❌ task id not found: {task_id}")
            return False
        
        return self.load_task_by_path(task_path)
    
    def load_task_by_path(self, task_path: str) -> bool:
        """
        load task by task path
        
        Args:
            task_path: task path
            
        Returns:
            whether task is loaded successfully
        """
        try:
            # read task data
            traj_file = os.path.join(task_path, "traj_data.json")
            if not os.path.exists(traj_file):
                print(f"❌ traj data not found: {traj_file}")
                return False
            
            with open(traj_file, 'r') as f:
                traj_data = json.load(f)
            
            # reset environment to specified scene
            scene_num = traj_data["scene"]["floor_plan"]
            event = self.env.reset(scene_num)
            
            # restore environment state
            self.env.restore_scene(
                traj_data["scene"]["object_poses"],
                traj_data["scene"]["object_toggles"],
                traj_data["scene"]["dirty_and_empty"]
            )
            
            # create task object
            from env.tasks import get_task
            import argparse
            
            args = argparse.Namespace(reward_config='/local-ssd/alfred/alfred_env/models/config/rewards.json')
            self.task = get_task(traj_data["task_type"], traj_data, self.env, args)
            
            self.current_task_path = task_path
            print(f"✅ task loaded successfully: {task_path}")
            return True
            
        except Exception as e:
            print(f"❌ task loading failed: {e}")
            return False
    
    def get_current_observation(self) -> Dict:
        """
        get current observation
        
        Returns:
            dictionary containing image, object state, etc.
        """
        if not self.env:
            return {"error": "environment not initialized"}
        
        # get current state
        event = self.env.last_event
        
        # extract image
        image = event.frame
        
        # extract object information
        objects = []
        for obj in event.metadata['objects']:
            objects.append({
                'objectId': obj['objectId'],
                'objectType': obj['objectType'],
                'position': obj['position'],
                'rotation': obj['rotation'],
                'visible': obj['visible'],
                'receptacle': obj.get('receptacle', False),
                'openable': obj.get('openable', False),
                'isOpen': obj.get('isOpen', False),
                'pickupable': obj.get('pickupable', False),
                'isPickedUp': obj.get('isPickedUp', False),
                'toggleable': obj.get('toggleable', False),
                'isToggled': obj.get('isToggled', False),
                'temperature': obj.get('temperature', None),
                'receptacleObjectIds': obj.get('receptacleObjectIds', [])
            })
        
        # extract agent state
        agent_state = {
            'position': event.metadata['agent']['position'],
            'rotation': event.metadata['agent']['rotation'],
            'cameraHorizon': event.metadata['agent']['cameraHorizon'],
            'inReceptacleObjectIds': event.metadata['agent'].get('inReceptacleObjectIds', [])
        }
        
        return {
            'image': image,
            'objects': objects,
            'agent': agent_state,
            'lastActionSuccess': event.metadata['lastActionSuccess'],
            'errorMessage': event.metadata.get('errorMessage', ''),
            'actionReturn': event.metadata.get('actionReturn', None)
        }
    
    def execute_action(self, action: Dict) -> Dict:
        """
        execute AI2-THOR action
        
        Args:
            action: AI2-THOR action dictionary
            
        Returns:
            execution result
        """
        if not self.env:
            return {"success": False, "error": "environment not initialized"}
        
        try:
            # execute action
            event = self.env.step(action)
            
            # get execution result
            result = {
                'success': event.metadata['lastActionSuccess'],
                'errorMessage': event.metadata.get('errorMessage', ''),
                'agent_position': event.metadata['agent']['position'],
                'agent_rotation': event.metadata['agent']['rotation'],
                'actionReturn': event.metadata.get('actionReturn', None)
            }
            
            return result
            
        except Exception as e:
            return {"success": False, "error": str(e)}

class SimplePDDLMapper:
    """
    simplified PDDL mapper, using data-driven method
    """
    
    def __init__(self, alfred_env: ALFREDEnvironment, objects_mapping: dict):
        self.alfred_env = alfred_env
        self.name_to_object = {v["object_name"]: v for k, v in objects_mapping.items()}
    
    def execute_pddl_action(self, pddl_action: dict) -> Dict:
        """
        execute PDDL action (mapped to AI2-THOR action)
        
        Args:
            pddl_action: {"name": name, "args": [args]}
            
        Returns:
            execution result
        """
        # get corresponding AI2-THOR action sequence
        action_name = pddl_action["name"]
        args = pddl_action["args"]  # the first arg is always the agent

        if action_name == "gotolocation":
            _, object_name = args
            x, _, z, _, y, _ = self.name_to_object[object_name]["coords"]
            _, _, rotation, horizon = self.name_to_object[object_name]["location"].split("|")[1:]
            agent_height = self.alfred_env.env.last_event.metadata["agent"]["position"]["y"]

            offsets = [(0, 0), (0.25, 0), (-0.25, 0), (0, 0.25), (0, -0.25)]
            success = False
            for off_x, off_z in offsets:
                action = {
                    "action": "TeleportFull",
                    "x": x * 0.25 + off_x,
                    "y": agent_height,
                    "z": z * 0.25 + off_z,
                    "rotateOnTeleport": True,
                    "rotation": int(rotation) * 90,
                    "horizon": int(horizon),
                }
                result = self.alfred_env.execute_action(action)
                if result["success"]:
                    print(f"Teleported to {object_name} successfully")
                    success = True
                    break
                else:
                    print(f"Teleported to {object_name} failed, error: {result['errorMessage']}")
            
            if not success:
                return {"success": False, "error": f"Failed to go to location {object_name}"}

            return result

        elif action_name == "pickupobjectinreceptacle":
            _, object_name, _ = args
            object_id = self.name_to_object[object_name]["object_env_id"] # no receptacle id needed
            action = {"action": "PickupObject", "objectId": object_id, "forceAction": True} # force to be visible to agent

        elif action_name == "pickupobjectnoreceptacle":
            _, object_name = args
            object_id = self.name_to_object[object_name]["object_env_id"]
            action = {"action": "PickupObject", "objectId": object_id, "forceAction": True}

        elif action_name == "putobjectinreceptacle":
            _, object_name, receptacle_name = args
            object_id = self.name_to_object[object_name]["object_env_id"]
            receptacle_id = self.name_to_object[receptacle_name]["object_env_id"]
            action = {"action": "PutObject", "objectId": object_id, "receptacleId": receptacle_id, "forceAction": True}

        elif action_name == "closeobject":
            _, object_name = args
            object_id = self.name_to_object[object_name]["object_env_id"]
            action = {"action": "CloseObject", "objectId": object_id, "forceAction": True}

        elif action_name == "openobject":
            _, object_name = args
            object_id = self.name_to_object[object_name]["object_env_id"]
            action = {"action": "OpenObject", "objectId": object_id, "forceAction": True}

        elif action_name == "toggleobject":
            _, object_name = args
            object_id = self.name_to_object[object_name]["object_env_id"]
            action = {"action": "ToggleObject", "objectId": object_id, "forceAction": True}

        elif action_name == "coolobject":
            pass

        elif action_name == "heatobject":
            pass
        
        elif action_name == "sliceobject":
            pass

        elif action_name == "cleanobject":
            pass

        print(f"Action: {action}")

        return self.alfred_env.execute_action(action)

# utility functions
def get_full_observations(alfred_env: ALFREDEnvironment, num_images: int = 8, look_down_angle: int = 0):
    observations = []
    angle_steps = 360 // num_images

    current_obseravtion = alfred_env.get_current_observation() # numpy.ndarray
    current_position = current_obseravtion["agent"]["position"]
    current_horizon = current_obseravtion["agent"]["cameraHorizon"]
    agent_height = current_position["y"]

    for i in range(num_images):
        rotation_angle = i * angle_steps
        action = {
            "action": "TeleportFull",
            "x": current_position["x"],
            "y": agent_height,
            "z": current_position["z"],
            "rotateOnTeleport": True,
            "rotation": rotation_angle,
            "horizon": current_horizon + look_down_angle,
        }
        result = alfred_env.execute_action(action)

        if result["success"]:
            observation = alfred_env.get_current_observation()
            observations.append(observation["image"])
        objects = observation["objects"] # take objects from last observation

    return observations, objects

def save_image(image: np.ndarray, path: str):
    """save image to file"""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    cv2.imwrite(path, cv2.cvtColor(image, cv2.COLOR_RGB2BGR))

def print_objects_summary(objects: List[Dict]):
    """print object summary"""
    print(f"there are {len(objects)} objects in the environment:")
    for obj in objects[:10]:  # only show first 10
        print(f"  - {obj['objectType']}: {obj['objectId']} (Visible: {obj['visible']})")
    if len(objects) > 10:
        print(f"  ... and {len(objects) - 10} more objects")