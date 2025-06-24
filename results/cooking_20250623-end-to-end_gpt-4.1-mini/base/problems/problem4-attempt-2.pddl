(define (problem cooking_task)
  (:domain cooking)
  (:objects
    carrot tomato - vegetable
    knife - tool
    robot1 robot2 - robot
    workspace bowl - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (is-whole tomato)
    (not (is-sliced carrot))
    (not (is-sliced tomato))
    (available carrot)
    (available tomato)
    (at carrot workspace)
    (at tomato workspace)
    (at bowl workspace)
    (is-workspace workspace)
  )
  (:goal
    (and
      (is-sliced carrot)
      (is-sliced tomato)
      (at carrot bowl)
      (at tomato bowl)
    )
  )
)