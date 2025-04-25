(define (problem slice-tomato-place-in-bowl)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato - vegetable
    knife - tool
    bowl - location
    cutting_board - location
    counter - location
  )
  (:init
    (free robot1)
    (free robot2)
    (available tomato)
    (is-whole tomato)
    (not (is-sliced tomato))
    (at tomato counter)
    (at bowl counter)
    (at knife cutting_board)
    (can-cut knife)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced tomato)
    (at tomato bowl)
  ))
)