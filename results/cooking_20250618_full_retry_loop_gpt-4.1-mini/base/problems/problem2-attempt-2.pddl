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
    (not (is-sliced tomato))  ; This should be omitted in init, removed below
    
    (is-whole cucumber)
    (is-sliced dressing_bottle) ; dressing bottle can't be sliced, so better to omit this
    
    ; Locations of vegetables
    (at tomato counter)
    (at cucumber counter)
    (at dressing_bottle counter)
    
    ; Locations of tools? Tools can be held or available, location is unnecessary for knife since carried
    
    ; Workspace
    (is-workspace cutting_board)
    
    ; Availability
    (available tomato)
    (available cucumber)
    (available dressing_bottle)
  )
  (:goal (and
    (is-sliced tomato)
    (at tomato bowl)
  ))
)