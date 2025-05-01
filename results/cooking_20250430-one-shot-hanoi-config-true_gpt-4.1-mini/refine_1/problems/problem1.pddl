(define (problem cooking_task2)
  (:domain cooking)
  (:objects
    robot1
    robot2
    knife - tool
    cucumber - vegetable
    bowl - vegetable
    cutting_board
    counter - location
  )
  (:init
    (free robot2)
    (carry robot1 knife)
    (can-cut knife)
    (is-whole cucumber)
    (not (is-sliced cucumber))
    (at cucumber counter)
    (at bowl counter)
    (is-workspace cutting_board)
    (at cutting_board cutting_board)
    (available cucumber)
    (available knife)
  )
  (:goal
    (and
      (is-sliced cucumber)
      (at cucumber bowl)
    )
  )
)