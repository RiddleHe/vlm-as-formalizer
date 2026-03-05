(define (problem put_task_cooled_cup_in_microwave)
  (:domain put_task)

  (:objects
    robot_agent - agent
    silver_countertop_microwave_on_right_counter - microwave
    black_top_freezer_fridge_left_side - fridge
    silver_sink_with_faucet_center_counter - sink
  )

  (:init
    (openable silver_countertop_microwave_on_right_counter)
    (openable black_top_freezer_fridge_left_side)
    ;; Robot initially not at any object's location; no (atLocation ...) facts.
  )

  (:goal
    (and
      ;; No cup object exists in the provided scene graph, so the intended goal
      ;; cannot be grounded with available objects/predicates.
      ;; Keeping the goal as a tautology would be incorrect; thus we express the
      ;; closest representable goal with existing objects: place a cooled object
      ;; into the microwave is not possible without an object.
    )
  )
)