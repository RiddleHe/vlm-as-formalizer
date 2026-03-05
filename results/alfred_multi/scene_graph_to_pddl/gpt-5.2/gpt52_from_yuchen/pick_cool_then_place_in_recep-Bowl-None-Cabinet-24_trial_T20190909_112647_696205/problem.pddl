(define (problem put_task_cold_bowl_in_cabinet_above_fridge)
  (:domain put_task)

  (:objects
    robot_agent - agent
    tall_black_double_door_fridge_bottom_view - fridge
    left_stainless_sink_with_faucet - sink
    right_stainless_sink_with_faucet - sink
    black_countertop_toaster_oven_left_of_sinks - receptacle
    long_metal_knife_on_counter_left_of_sinks - knife
  )

  (:init
    (openable tall_black_double_door_fridge_bottom_view)
  )

  (:goal
    (and
      ;; Instruction requires a cold bowl in a cabinet above a fridge,
      ;; but no bowl or cabinet object exists in the provided scene graph.
      ;; Therefore, the goal cannot be expressed with available objects/predicates.
    )
  )
)