(define (problem put_cold_brown_ball_in_sink)
  (:domain put_task)
  (:objects
    robot - agent
    fridge1 - fridge
    sink1 - sink
    brown_ball1 - object
  )
  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (robot starts at no location)
    (inReceptacle brown_ball1 fridge1)

    ;; initial state of the ball
    (isCool brown_ball1)
  )
  (:goal
    (and
      (inReceptacle brown_ball1 sink1)
      (isCool brown_ball1)
    )
  )
)