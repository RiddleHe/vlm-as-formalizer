(define (problem put_task_kitchen_01)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    knife1 - knife
    pan1 - receptacle
    potato1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)

    ;; initial object locations (from scene)
    (inReceptacle potato1 sink1)

    ;; agent initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle pan1 fridge1)
      (inReceptacle knife1 pan1)
      (inReceptacle potato1 pan1)
      (isSliced potato1)
      (isHot potato1)
    )
  )
)