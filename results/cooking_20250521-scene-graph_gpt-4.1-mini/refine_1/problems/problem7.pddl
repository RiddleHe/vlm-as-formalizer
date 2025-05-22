(define (problem slice_vegetables)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    knife - tool
    cucumber carrot tomato - vegetable
    bowl cutting_board counter - location
  )
  (:init
    ; Robots
    (free robot1)
    (carry robot2 knife)
    ; Tools
    (can-cut knife)
    ; Vegetables states
    (is-whole cucumber) (is-whole carrot) (is-whole tomato)
    (not (is-sliced cucumber)) (not (is-sliced carrot)) (not (is-sliced tomato))
    (available cucumber) (available carrot) (available tomato)
    ; Locations
    (at cucumber counter)
    (at carrot counter)
    (at tomato counter)
    (at bowl counter)
    (at cutting_board counter)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced cucumber) (is-sliced carrot) (is-sliced tomato)
    (at cucumber bowl) (at carrot bowl) (at tomato bowl)
  ))
)