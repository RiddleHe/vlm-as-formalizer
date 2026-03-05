(define (problem put_task_kitchen_bowl_cupboard)
  (:domain put_task)
  (:objects
    robot - agent

    cupboard_left_of_dishwasher - receptacle
    dishwasher - receptacle

    bowl - object
  )

  (:init
    ;; receptacle properties
    (openable cupboard_left_of_dishwasher)

    ;; initial object placements / containment
    ;; (not (inReceptacle bowl ...)) is left unspecified (closed-world not assumed)

    ;; robot starts with no location and holds nothing (per instruction)
  )

  (:goal
    (and
      (inReceptacle bowl cupboard_left_of_dishwasher)
    )
  )
)