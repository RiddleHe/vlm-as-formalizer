(define (problem put_cold_tomato_in_microwave)
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

    ;; initial object locations / containment
    (inReceptacle tomato1 fridge1)

    ;; robot initially not at any location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isCool tomato1)
      (inReceptacle tomato1 microwave1)
    )
  )
)