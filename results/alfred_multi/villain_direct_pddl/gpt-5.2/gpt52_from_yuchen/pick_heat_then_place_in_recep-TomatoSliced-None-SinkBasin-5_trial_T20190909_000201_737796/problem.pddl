(define (problem put_task_tomato_slice_heated_in_sink)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
    microwave1 - microwave
    fridge1 - fridge
    knife1 - knife
    tomato1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations (as receptacles containing objects)
    (inReceptacle knife1 sink1)
    (inReceptacle tomato1 sink1)

    ;; robot initial state (not holding anything, and not at any location)
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced tomato1)
      (isHot tomato1)
      (inReceptacle tomato1 sink1)
    )
  )
)