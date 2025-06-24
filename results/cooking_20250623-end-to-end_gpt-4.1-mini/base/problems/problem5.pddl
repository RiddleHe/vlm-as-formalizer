(define (problem slice-vegetables)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife - tool
    bowl cutting_board table - location
    tomato cucumber - vegetable
  )
  (:init
    ; Tool capabilities
    (can-cut knife)

    ; Robots state
    (carry robot2 knife)
    (free robot1)

    ; Locations workspace setup
    (is-workspace cutting_board)

    ; Vegetables state and location
    (is-whole tomato)
    (available tomato)
    (is-whole cucumber)
    (available cucumber)

    ; Locations of objects
    (at tomato table)
    (at cucumber table)
    (at bowl table)
  )
  (:goal (and
    (is-sliced tomato)
    (is-sliced cucumber)
    (at tomato bowl)
    (at cucumber bowl)
    (free robot1)
    (free robot2)
  ))
)