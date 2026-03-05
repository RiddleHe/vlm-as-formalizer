(define (problem put_task_microwaved_cup_into_fridge)
  (:domain put_task)
  (:objects
    robot_agent - agent

    countertop_microwave_red_front - microwave
    tall_fridge_white_double_door - fridge
    double_basin_sink_stainless_left - sink
    double_basin_sink_stainless_right - sink

    black_handle_spatula_like_knife_in_right_sink - knife
    green_cabbage_like_vegetable_in_right_sink - object
  )

  (:init
    (openable countertop_microwave_red_front)
    (openable tall_fridge_white_double_door)

    (inReceptacle black_handle_spatula_like_knife_in_right_sink double_basin_sink_stainless_right)
    (inReceptacle green_cabbage_like_vegetable_in_right_sink double_basin_sink_stainless_right)
  )

  ;; Instruction: Put a microwaved cup into the fridge
  ;; Note: No cup object is present in the provided scene graph, so the task
  ;; cannot be grounded without violating the constraint that all PDDL objects
  ;; must exist in the scene graph.
  (:goal
    (and)
  )
)