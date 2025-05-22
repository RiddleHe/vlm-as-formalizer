(define (problem slice_vegetables)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    knife - tool
    cucumber carrot tomato - vegetable
    bowl cutting_board counter cutting_board_location - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole cucumber)
    (is-whole carrot)
    (is-whole tomato)
    (not (is-sliced cucumber))
    (not (is-sliced carrot))
    (not (is-sliced tomato))
    (available cucumber)
    (available carrot)
    (available tomato)
    (empty bowl)
    (at cucumber counter)
    (at carrot counter)
    (at tomato counter)
    (at bowl counter)
    (at cutting_board cutting_board_location)
    (is-workspace cutting_board_location)
  )
  (:goal (and
    (is-sliced cucumber) (is-sliced carrot) (is-sliced tomato)
    (at cucumber bowl) (at carrot bowl) (at tomato bowl)
  ))
)