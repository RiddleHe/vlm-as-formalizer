(define (problem slice_and_place_carrot)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    knife - tool
    carrot - vegetable
    cutting_board - location
    bowl_platform - location
    black_platform - location
    bowl - object
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (available carrot)
    (at carrot black_platform)
    (at bowl bowl_platform)
    (at cutting_board cutting_board)
    (is-workspace cutting_board)
    (available bowl)
  )
  (:goal
    (and
      (is-sliced carrot)
      (at carrot bowl_platform)
    )
  )
)