(define (problem put_task_cold_bowl_in_cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    cabinet_above_fridge1 - receptacle

    bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet_above_fridge1)

    ;; initial object placements / locations
    (inReceptacle bowl1 fridge1)

    ;; bowl is already cold
    (isCool bowl1)
  )

  (:goal
    (and
      (inReceptacle bowl1 cabinet_above_fridge1)
      (isCool bowl1)
    )
  )
)