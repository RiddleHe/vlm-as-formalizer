(define (problem slice_and_place_vegetables)
  (:domain cooking)
  (:objects 
    robot1 robot2 - robot
    knife - tool
    cutting_board bowl counter - location
    tomato cucumber - vegetable
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-workspace cutting_board)
    (at tomato counter)
    (at cucumber counter)
    (at bowl counter)
    (is-whole tomato)
    (is-whole cucumber)
    (available tomato)
    (available cucumber)
  )
  (:goal (and
    (is-sliced tomato)
    (is-sliced cucumber)
    (at tomato bowl)
    (at cucumber bowl)
  ))
)