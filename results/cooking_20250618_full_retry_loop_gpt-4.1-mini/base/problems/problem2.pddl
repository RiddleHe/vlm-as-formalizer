(define (problem slice_tomato)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife - tool
    tomato cucumber dressing_bottle - vegetable
    cutting_board bowl counter - location
  )
  (:init
    ; Robot states
    (free robot1)
    (carry robot2 knife)
    ; Tool capability
    (can-cut knife)
    ; Vegetable states
    (is-whole tomato)
    (is-whole cucumber)
    ; Locations of vegetables (initially on counter)
    (at tomato counter)
    (at cucumber counter)
    (at dressing_bottle counter)
    ; Workspace
    (is-workspace cutting_board)
    ; Availability of vegetables
    (available tomato)
    (available cucumber)
    (available dressing_bottle)
  )
  (:goal (and
    (is-sliced tomato)
    (at tomato bowl)
  ))
)