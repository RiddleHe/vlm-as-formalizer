(define (problem put_task_chill_apple_bin)
  (:domain put_task)
  (:objects
    robot - agent
    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink
    whitebin1 - receptacle
    apple1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object containment / locations (from scene)
    (inReceptacle apple1 fridge1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isCool apple1)
      (inReceptacle apple1 whitebin1)
    )
  )
)