(define (problem put_task_chill_tomato_microwave)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    tomato1 - object
  )
  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial object placements (from scene)
    (inReceptacle tomato1 fridge1)

    ;; robot initially not at any object's location (so no atLocation facts)
  )
  (:goal
    (and
      (isCool tomato1)
      (inReceptacle tomato1 microwave1)
    )
  )
)