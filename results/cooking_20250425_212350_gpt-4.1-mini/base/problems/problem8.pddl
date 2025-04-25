(define (problem cooking1)
  (:domain cooking)
  (:objects
    robot1 - robot
    cucumber tomato - vegetable
    knife - tool
    cutting_board bowl counter - location
  )
  (:init
    (free robot1)
    (available knife)
    (can-cut knife)
    (is-whole cucumber)
    (is-whole tomato)
    (not (is-sliced cucumber))
    (not (is-sliced tomato))
    (at cucumber counter)
    (at tomato cutting_board)
    (at knife robot1)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced cucumber)
    (at cucumber bowl)
    (at tomato bowl)
  ))
)