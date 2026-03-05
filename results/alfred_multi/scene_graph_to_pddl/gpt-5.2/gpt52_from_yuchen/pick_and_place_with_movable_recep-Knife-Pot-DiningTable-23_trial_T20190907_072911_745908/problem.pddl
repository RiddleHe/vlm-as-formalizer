(define (problem put_task_pan_knife_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    green_table_surface - receptacle
    right_frying_pan_on_table - receptacle
    left_pot_on_stove - receptacle
    right_pot_on_stove - receptacle
    metal_trash_can_right_of_stove - receptacle

    wooden_handle_knife_on_table - knife
  )

  (:init
    ;; Robot starts not at any object's location
    ;; No objects are initially in any receptacle per scene graph
  )

  (:goal
    (and
      (inReceptacle wooden_handle_knife_on_table right_frying_pan_on_table)
      (inReceptacle right_frying_pan_on_table green_table_surface)
    )
  )
)