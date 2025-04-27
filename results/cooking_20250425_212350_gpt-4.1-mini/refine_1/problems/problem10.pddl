(define (problem cooking1)
  (:domain cooking)
  (:objects
    tom - vegetable
    carrot - vegetable
    bowl - location
    cutting_board - location
    robot1 - robot
    knife - tool
  )
  (:init
    (is-whole tom)
    (is-whole carrot)
    (available tom)
    (available carrot)
    (available knife)
    (free robot1)
    (can-cut knife)
    (at tom cutting_board)
    (at carrot bowl)
    (at knife cutting_board)
    (is-workspace cutting_board)
  )
  (:goal
    (and
      (is-sliced tom)
      (not (is-whole tom))
      (at tom bowl)
      (at carrot bowl)
    )
  )
)