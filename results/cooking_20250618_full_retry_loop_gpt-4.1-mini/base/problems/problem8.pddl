(define (problem cooking_task1)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife spatula spoon - tool
    cucumber tomato dressing - vegetable
    bowl cutting_board counter - location
  )
  (:init
    ; Robots
    (free robot1)
    (carry robot2 knife)

    ; Tools cutting capability
    (can-cut knife)

    ; Vegetable states - only positives
    (available cucumber)
    (available tomato)
    (available dressing)
    (is-whole cucumber)
    (is-whole tomato)

    ; Locations of objects
    (at cucumber counter)
    (at tomato counter)
    (at dressing counter)
    (at bowl counter)
    (at cutting_board counter)

    ; Workspace
    (is-workspace cutting_board)
  )
  (:goal
    (and
      (is-sliced cucumber)
      (at cucumber bowl)
      (at tomato bowl)
    )
  )
)