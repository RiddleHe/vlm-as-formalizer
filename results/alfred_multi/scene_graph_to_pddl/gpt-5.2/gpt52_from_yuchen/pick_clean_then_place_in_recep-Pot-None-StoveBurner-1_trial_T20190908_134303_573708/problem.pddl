(define (problem put_task_pot_on_stove)
  (:domain put_task)

  (:objects
    robot - agent

    sink_stainless_in_countertop - sink

    stove_front_right_burner_grate - receptacle
    stove_front_left_burner_grate - receptacle
    pot_metal_on_front_right_burner - receptacle
    pot_metal_on_front_left_burner - receptacle

    cup_white_on_right_counter - object
  )

  (:init
    ;; Object placements (from scene graph)
    (inReceptacle pot_metal_on_front_right_burner stove_front_right_burner_grate)
    (inReceptacle pot_metal_on_front_left_burner stove_front_left_burner_grate)
    (inReceptacle cup_white_on_right_counter sink_stainless_in_countertop)
  )

  (:goal
    (and
      ;; Put a pot with water in it on the stove.
      ;; Water state is not representable in this domain; enforce pot on stove.
      (inReceptacle pot_metal_on_front_right_burner stove_front_right_burner_grate)
    )
  )
)