(define (problem cooking_problem_fixed)
  (:domain cooking)
  (:objects
    robot1 - robot
    tomato - vegetable
    carrots - vegetable
    knife - tool
    table - location
    cutting_board - location
    bowl1 - bowl
  )
  (:init
    (at tomato table)
    (at carrots table)
    (at knife cutting_board)
    (sliceable tomato)
    (sliceable carrots)
    (available tomato)
    (available carrots)
    (available knife)
  )
  (:goal
    (and
      (sliced tomato)
      (in tomato bowl1)
      (in carrots bowl1)
    )
  )
)