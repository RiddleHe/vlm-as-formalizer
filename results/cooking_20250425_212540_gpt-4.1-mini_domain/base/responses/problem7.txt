(define (problem cooking1)
  (:domain cooking)
  (:objects
    robot1 - robot
    cucumber carrot tomato - vegetable
    knife - tool
    bowl1 - bowl
    table - location
  )
  (:init
    (at cucumber table)
    (at carrot table)
    (at tomato table)
    (at bowl1 table)
    (available knife)
    (robot_at robot1 table)
  )
  (:goal
    (and
      (in cucumber bowl1)
      (in carrot bowl1)
      (in tomato bowl1)
      (sliced cucumber)
      (sliced carrot)
      (sliced tomato)
    )
  )
)