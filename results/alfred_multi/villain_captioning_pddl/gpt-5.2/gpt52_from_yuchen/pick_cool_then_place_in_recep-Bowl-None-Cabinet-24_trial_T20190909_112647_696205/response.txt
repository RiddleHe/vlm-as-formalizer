(define (problem put_task_kitchen_cold_bowl_cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    sink1 - sink

    cabinet_above_fridge1 - receptacle

    bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable cabinet_above_fridge1)

    ;; initial contents / locations inferred from scene
    (inReceptacle bowl1 sink1)

    ;; state of objects
    (isCool bowl1)

    ;; robot starts not at any object location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle bowl1 cabinet_above_fridge1)
      (isCool bowl1)
    )
  )
)