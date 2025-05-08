(define (problem cooking-problem-1)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    cucumber tomato - vegetable
    knife - tool
    bowl cutting_board counter - location
  )
  (:init
    (is-whole cucumber)
    (not (is-sliced cucumber))
    (at cucumber counter)
    (is-sliced tomato)
    (not (is-whole tomato))
    (at tomato cutting_board)
    (at bowl counter)
    (is-workspace cutting_board)
    (can-cut knife)

    (available cucumber)
    (free robot1)
    (carry robot2 knife)
    (not (free robot2))
    (available bowl)
    (available tomato)
    (available knife)
  )
  (:goal (and
    (is-sliced cucumber)
    (at cucumber bowl)
    (at tomato bowl)
  ))
)