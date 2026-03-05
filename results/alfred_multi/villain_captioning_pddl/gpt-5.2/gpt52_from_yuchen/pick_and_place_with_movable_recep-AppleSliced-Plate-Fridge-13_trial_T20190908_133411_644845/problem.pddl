(define (problem put_plate_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    plate1 - receptacle
    knife1 - knife
    apple_piece1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object containment / placement (from scene)
    (inReceptacle knife1 plate1)
    (inReceptacle apple_piece1 plate1)

    ;; robot starts not at any location (no atLocation facts asserted)
  )

  (:goal
    (and
      (inReceptacle plate1 fridge1)
    )
  )
)