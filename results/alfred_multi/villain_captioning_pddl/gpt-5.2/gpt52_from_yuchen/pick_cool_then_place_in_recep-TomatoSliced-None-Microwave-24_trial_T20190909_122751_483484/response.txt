(define (problem put_cold_tomato_in_microwave)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink_left - sink
    sink_right - sink
    tomato1 - object
    spoon1 - object
    fork1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; observed containment
    (inReceptacle tomato1 microwave1)
    (inReceptacle spoon1 sink_left)
    (inReceptacle fork1 sink_right)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))

    ;; instruction refers to "cold tomato"
    (isCool tomato1)
  )

  (:goal
    (and
      (inReceptacle tomato1 microwave1)
    )
  )
)