(define (problem puttask_kitchen_coolcup_microwave)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    cup1 - object
    dish1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; receptacle open/closed states inferred from scene (both closed)
    (not (opened microwave1))
    (not (opened fridge1))

    ;; object containment from scene
    (inReceptacle dish1 microwave1)

    ;; task-relevant object state (required by instruction)
    (isCool cup1)

    ;; agent initially holds nothing and is not at any object's location
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle cup1 microwave1)
      (isCool cup1)
    )
  )
)