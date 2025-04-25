(define (problem cooking_task1)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot - vegetable
    knife - tool
    cutting_board bowl counter - location
  )
  (:init
    (free robot1)
    (available carrot)
    (is-whole carrot)
    (not (is-sliced carrot))
    (can-cut knife)
    (at carrot counter)
    (at knife cutting_board)
    (is-workspace cutting_board)
    (at bowl counter)
  )
  (:goal
    (and
      (is-sliced carrot)
      (at carrot bowl)
    )
  )
)