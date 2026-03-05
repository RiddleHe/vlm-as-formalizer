(define (problem put_task_bowl_in_cupboard_left_of_dishwasher)
  (:domain put_task)
  (:objects
    robot_agent - agent
    white_dishwasher_front - receptacle
  )
  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; No receptacles in the provided scene graph are marked openable/opened

    ;; No object containment relations are provided in the scene graph
  )
  (:goal
    (and
      ;; The instruction mentions a "bowl" and a "cupboard to the left of the dishwasher",
      ;; but neither a bowl nor a cupboard object exists in the provided scene graph.
      ;; Therefore, a valid goal cannot be expressed using only existing objects.
      (inReceptacle white_dishwasher_front white_dishwasher_front)
    )
  )
)