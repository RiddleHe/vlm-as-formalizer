(define (problem cucumber_slicing)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    knife - tool
    cutting_board bowl - location
    cucumber - vegetable
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole cucumber)
    (available cucumber)
    (at cucumber cutting_board)
    (is-workspace cutting_board)
    (at bowl cutting_board)
  )
  (:goal (and
    (is-sliced cucumber)
    (at cucumber bowl)
  ))
)