(define (problem slice_tomato)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato - vegetable
    knife - tool
    cutting_board bowl workspace - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole tomato)
    (not (is-sliced tomato))
    (available tomato)
    (at tomato cutting_board)
    (is-workspace workspace)
    (at cutting_board workspace)
    (at bowl workspace)
  )
  (:goal
    (and
      (is-sliced tomato)
      (at tomato bowl)
    )
  )
)