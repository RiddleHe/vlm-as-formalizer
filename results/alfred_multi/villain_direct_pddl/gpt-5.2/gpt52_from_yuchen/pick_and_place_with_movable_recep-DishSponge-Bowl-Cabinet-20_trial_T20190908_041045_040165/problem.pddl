(define (problem put_task_bowl_cupboard_left_of_dishwasher)
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

    ;; object locations (robot must navigate first)
    (inReceptacle bowl dishwasher)
  )

  (:goal
    (and
      (inReceptacle bowl cupboard_left_of_dishwasher)
    )
  )
)