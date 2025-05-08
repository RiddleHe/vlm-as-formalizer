(define (problem cook-salad)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato carrot - vegetable
    bowl cutting_board counter - location
    knife - tool
  )
  (:init
    ; object locations and states
    (at tomato counter)
    (is-whole tomato)
    (available tomato)
    (at carrot counter)
    (is-whole carrot)
    (available carrot)
    (at bowl counter)
    (available bowl)
    (at knife robot2)
    (can-cut knife)

    ; workspace specification
    (is-workspace cutting_board)

    ; robot states
    (free robot1)
    (carry robot2 knife)
    (not (free robot2))
  )
  (:goal
    (and
      (is-sliced tomato)
      (is-sliced carrot)
      (at tomato bowl)
      (at carrot bowl)
    )
  )
)