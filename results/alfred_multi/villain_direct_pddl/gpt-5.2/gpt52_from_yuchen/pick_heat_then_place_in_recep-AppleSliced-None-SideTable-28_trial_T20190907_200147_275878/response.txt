(define (problem put_task_kitchen_apple_slice)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    knife1 - knife

    apple1 - object
    brown_shelf1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; initial containment / placement
    (inReceptacle apple1 brown_shelf1)
    (inReceptacle knife1 sink1)

    ;; robot initially not at any object's location and holds nothing
  )

  (:goal
    (and
      (isSliced apple1)
      (isHot apple1)
      (inReceptacle apple1 brown_shelf1)
    )
  )
)