(define (problem put_task_scene)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    table1 - receptacle
    sponge1 - receptacle
    apple1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; initial object placements / locations from the scene
    (inReceptacle apple1 table1)
    (inReceptacle sponge1 table1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot apple1)
      (inReceptacle apple1 table1)
      (inReceptacle sponge1 table1)
    )
  )
)