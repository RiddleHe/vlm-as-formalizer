(define (problem put_task_scene)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    cup1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial containment / placement
    (inReceptacle cup1 fridge1)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle cup1 microwave1)
      (isCool cup1)
    )
  )
)