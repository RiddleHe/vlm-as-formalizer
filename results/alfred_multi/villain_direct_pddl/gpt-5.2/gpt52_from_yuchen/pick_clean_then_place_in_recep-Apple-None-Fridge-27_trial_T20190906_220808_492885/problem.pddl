(define (problem puttask_clean_apple_in_fridge)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    apple1 - object
    cup1 - object
    bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial containment (from scene)
    (inReceptacle apple1 microwave1)
    (inReceptacle cup1 sink1)
    (inReceptacle bowl1 sink1)

    ;; robot initially not at any object's location (so no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle apple1 fridge1)
      (isClean apple1)
    )
  )
)