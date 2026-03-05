(define (problem put_task_potato_slice_wash_microwave)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    potato1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; initial containment / locations from the scene
    (inReceptacle potato1 fridge1)

    ;; agent initially holds nothing and is not at any object's location
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean potato1)
      (isSliced potato1)
      (inReceptacle potato1 microwave1)
    )
  )
)