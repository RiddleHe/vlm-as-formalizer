(define (problem cooking2)
  (:domain cooking)
  (:objects
    robot1 - robot
    knife - tool
    cutting_board bowl counter - location
    cucumber carrot - vegetable
  )
  (:init
    (free robot1)
    (can-cut knife)
    (is-whole cucumber)
    (is-whole carrot)
    (not (is-sliced cucumber))
    (not (is-sliced carrot))
    (at knife cutting_board)
    (at cucumber cutting_board)
    (at carrot cutting_board)
    (at bowl counter)
    (is-workspace cutting_board)
    (available knife)
    (available cucumber)
    (available carrot)
  )
  (:goal (and
    (is-sliced cucumber)
    (is-sliced carrot)
    (at cucumber bowl)
    (at carrot bowl)
  ))
)