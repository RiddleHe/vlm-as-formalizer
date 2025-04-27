(define (problem cooking_problem_2)
  (:domain cooking)
  (:objects
    robot1 - robot
    tomato - vegetable
    carrot - vegetable
    knife - tool
    table - location
    bowl1 - bowl
  )
  (:init
    (at tomato table)
    (at carrot table)
    (at knife table)
    (sliceable tomato)
    (sliceable carrot)
    (available tomato)
    (available carrot)
    (available knife)
  )
  (:goal
    (and
      (sliced tomato)
      (in tomato bowl1)
      (in carrot bowl1)
    )
  )
)