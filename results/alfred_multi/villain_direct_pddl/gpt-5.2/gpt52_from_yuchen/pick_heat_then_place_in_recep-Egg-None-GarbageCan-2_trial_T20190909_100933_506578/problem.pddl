(define (problem heat_egg_trash)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    trash1 - receptacle

    egg1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial containment / locations from the scene
    (inReceptacle egg1 microwave1)

    ;; robot initially holds nothing and is not at any object's location
  )

  (:goal
    (and
      (isHot egg1)
      (inReceptacle egg1 trash1)
    )
  )
)