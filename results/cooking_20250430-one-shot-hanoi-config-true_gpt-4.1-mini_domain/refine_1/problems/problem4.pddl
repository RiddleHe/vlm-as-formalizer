(define (problem slice-and-place)
  (:domain cooking)
  (:objects
    robot1
    robot2
    carrot - vegetable
    tomato - vegetable
    knife - tool
    bowl1 - bowl
    table - location
  )
  (:init
    (holding robot1 knife)
    (at carrot table)
    (at tomato table)
    (at bowl1 table)
    (available carrot)
    (available tomato)
    (not (available knife))
    (not (robot-free robot1))
    (robot-free robot2)
  )
  (:goal (and
    (sliced carrot)
    (sliced tomato)
    (in carrot bowl1)
    (in tomato bowl1)
  ))
)