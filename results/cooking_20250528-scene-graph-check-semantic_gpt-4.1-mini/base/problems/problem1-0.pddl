(define (problem slice_cucumber)
  (:domain cooking)
  (:objects
    cucumber - vegetable
    knife - tool
    bowl - object
    cutting_board - location
    counter - location
    robot1 robot2 - robot
  )
  (:init
    (available cucumber)
    (available bowl)
    (available cutting_board)
    (is-whole cucumber)
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (at cucumber counter)
    (at bowl counter)
    (at cutting_board cutting_board)
    (is-workspace cutting_board)
  )
  (:goal
    (and
      (is-sliced cucumber)
      (at cucumber bowl)
    )
  )
)