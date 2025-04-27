(define (problem slice-tomato-place-in-bowl)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato - vegetable
    knife - tool
    bowl cutting_board counter - location
  )
  (:init
    (free robot1)
    (free robot2)
    (available tomato)
    (is-whole tomato)
    (not (is-sliced tomato))
    (at tomato counter)
    (at bowl counter)
    (at knife robot1) ; robot1 is carrying the knife, needed to slice
    (can-cut knife)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced tomato)
    (at tomato bowl)
  ))
)