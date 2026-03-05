(define (problem put_task_kitchen_01)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    potato1 - object
    knife1 - knife
    cup1 - object
    fork1 - object
    spoon1 - object
    spatula1 - object
    saltshaker1 - object
    kettle1 - object
    apple1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; initial containment / locations (as seen)
    (inReceptacle potato1 fridge1)
    (inReceptacle cup1 sink1)
    (inReceptacle fork1 sink1)
    (inReceptacle apple1 sink1)

    ;; robot initially not at any location/object and holds nothing
  )

  (:goal
    (and
      (isClean potato1)
      (isSliced potato1)
      (inReceptacle potato1 microwave1)
    )
  )
)