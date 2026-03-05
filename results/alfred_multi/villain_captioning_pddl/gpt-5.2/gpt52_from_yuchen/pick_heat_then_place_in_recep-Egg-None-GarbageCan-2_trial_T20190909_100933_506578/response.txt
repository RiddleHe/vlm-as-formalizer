(define (problem heat_egg_put_trash)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink
    trash1 - receptacle

    egg1 - object
    apple1 - object
    kettle1 - object
    toaster1 - object
    pot_stove1 - object
    pot_sink1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; initial locations (robot starts at no object's location per instruction)

    ;; object/receptacle relations from the scene
    (inReceptacle apple1 microwave1)
    (inReceptacle pot_sink1 sink1)

    ;; trash has some item already (unmodeled); no need to include

    ;; robot hand state
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot egg1)
      (inReceptacle egg1 trash1)
    )
  )
)