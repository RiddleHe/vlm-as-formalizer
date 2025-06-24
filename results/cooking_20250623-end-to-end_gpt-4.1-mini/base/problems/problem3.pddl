(define (problem slice-carrot-place-in-bowl)
  (:domain cooking)
  (:objects 
    robot1 robot2 - robot
    knife - tool
    carrot - vegetable
    bowl - object
    cutting_board workspace - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (available carrot)
    (at carrot workspace)
    (at bowl workspace)
    (is-workspace workspace)
  )
  (:goal (and
    (is-sliced carrot)
    (at carrot workspace)
    (free robot1)
    (free robot2)
  ))
)