(define (problem cooking_task_corrected)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot - vegetable
    knife - tool
    bowl - object
    workspace - location
  )
  (:init
    (not (free robot1))
    (carry robot1 knife)
    (available carrot)
    (is-whole carrot)
    (not (is-sliced carrot))
    (can-cut knife)
    (at carrot workspace)
    (at knife workspace)
    (at bowl workspace)
    (is-workspace workspace)
  )
  (:goal
    (and
      (is-sliced carrot)
      (at carrot bowl)
    )
  )
)