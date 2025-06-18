(define (problem cooking_task)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife - tool
    cutting_board bowl counter - location
    carrot - vegetable
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-workspace cutting_board)
    (at carrot counter)
    (is-whole carrot)
    (available carrot)
  )
  (:goal (and
    (is-sliced carrot)
    (at carrot bowl)
  ))
)