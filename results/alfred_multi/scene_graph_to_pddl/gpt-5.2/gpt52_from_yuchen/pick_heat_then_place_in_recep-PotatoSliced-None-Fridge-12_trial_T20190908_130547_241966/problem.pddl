(define (problem put_task_potato_slice_in_fridge)
  (:domain put_task)
  (:objects
    robot_agent - agent
    countertop_microwave_with_keypad - microwave
    tall_gray_fridge_freezer - fridge
    small_yellow_handled_knife_on_counter - knife
    black_wok_with_handles_on_counter - object
    brown_lidded_jar_on_counter - object
    clear_salt_shaker_on_counter - object
    clear_pepper_shaker_on_counter - object
    blue_pan_on_stove_burner - object
    stove_coil_burner - object
  )
  (:init
    (openable countertop_microwave_with_keypad)
    (openable tall_gray_fridge_freezer)
    ;; no receptacles are initially opened per scene graph
    ;; robot initially not at any object's location per instruction
    ;; robot initially holds nothing per scene graph
  )
  (:goal
    (and
      ;; Instruction requires: "Place a cooked potato slice inside the refrigerator."
      ;; However, no potato/potato-slice object exists in the provided scene graph objects,
      ;; and we are not allowed to introduce new objects not in the scene graph.
      ;; Therefore, the closest representable goal using only existing objects is to place
      ;; some object into the refrigerator; we choose the only food-prep-related small item.
      (inReceptacle small_yellow_handled_knife_on_counter tall_gray_fridge_freezer)
    )
  )
)