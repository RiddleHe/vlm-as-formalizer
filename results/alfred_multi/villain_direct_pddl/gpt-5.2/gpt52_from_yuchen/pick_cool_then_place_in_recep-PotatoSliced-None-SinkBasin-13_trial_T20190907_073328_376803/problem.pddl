(define (problem put_task_kitchen_01)
  (:domain put_task)
  (:objects
    robot - agent
    fridge1 - fridge
    sink1 - sink
    microwave1 - microwave
    knife1 - knife
    potato1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations / containment
    (inReceptacle potato1 fridge1)
    (inReceptacle knife1 fridge1)

    ;; robot initial condition
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced potato1)
      (isCool potato1)
      (inReceptacle potato1 sink1)
      (inReceptacle knife1 fridge1)
    )
  )
)