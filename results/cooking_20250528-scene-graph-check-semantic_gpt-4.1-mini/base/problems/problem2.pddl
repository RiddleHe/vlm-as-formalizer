(define (problem slice_tomato)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato - vegetable
    knife - tool
    bowl cutting_board counter - location
  )
  (:init
    (available tomato)
    (available bowl)
    (available counter)
    (available cutting_board)
    (is-whole tomato)
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (at tomato counter)
    (at bowl counter)
    (at cutting_board cutting_board)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced tomato)
    (at tomato bowl)
  ))
)