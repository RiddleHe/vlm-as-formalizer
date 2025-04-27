(define (problem cooking2)
  (:domain cooking)
  (:objects
    robot1 - robot
    cucumber - vegetable
    knife - tool
    cutting_board bowl counter - location
  )
  (:init
    (is-whole cucumber)
    (not (is-sliced cucumber))
    (available cucumber)
    (available knife)
    (free robot1)
    (can-cut knife)
    (at cucumber cutting_board)
    (at knife counter)
    (is-workspace cutting_board)
    (at bowl counter)
  )
  (:goal (and
    (is-sliced cucumber)
    (at cucumber bowl)
  ))
)