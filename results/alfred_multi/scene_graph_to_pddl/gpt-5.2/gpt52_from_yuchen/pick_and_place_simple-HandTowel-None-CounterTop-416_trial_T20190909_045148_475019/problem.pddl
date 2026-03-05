(define (problem put_task_hand_towel_on_counter)
  (:domain put_task)
  (:objects
    robot_agent - agent

    dark_stone_bathroom_countertop - receptacle
    oval_bathroom_sink_basin - sink

    wall_mounted_hand_towel_white - object
    blue_pump_bottle_right_of_sink - object
    small_yellow_bottle_right_of_sink - object
    purple_container_far_right_edge - object
    brown_cylindrical_object_left_of_sink - object
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; No receptacles are openable/opened in this scene per scene graph

    ;; Object locations / containment
    (inReceptacle brown_cylindrical_object_left_of_sink dark_stone_bathroom_countertop)
    (inReceptacle blue_pump_bottle_right_of_sink dark_stone_bathroom_countertop)
    (inReceptacle small_yellow_bottle_right_of_sink dark_stone_bathroom_countertop)
    (inReceptacle purple_container_far_right_edge dark_stone_bathroom_countertop)
    (inReceptacle oval_bathroom_sink_basin dark_stone_bathroom_countertop)

    ;; Hand towel is wall-mounted; not in any receptacle initially (no inReceptacle fact)
  )

  (:goal
    (and
      (inReceptacle wall_mounted_hand_towel_white dark_stone_bathroom_countertop)
    )
  )
)