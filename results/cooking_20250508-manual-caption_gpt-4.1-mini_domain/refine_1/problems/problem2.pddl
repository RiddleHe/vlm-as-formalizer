(define (problem cooking1)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    tomato - vegetable
    knife - tool
    bowl1 - bowl
    counter cutting_board_loc - location
  )
  (:init
    (at tomato counter)
    (at bowl1 counter)
    (cutting_board cutting_board_loc)
    (free robot1)
    (holding robot2 knife)
  )
  (:goal (and
    (sliced tomato)
    (at tomato bowl1)
  ))
)