(define (problem cooking_task2)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    bowl - object
    cucumber - vegetable
    tomato - vegetable
    carrot - vegetable
    knife - tool
    cutting_board - object
    counter - location
  )
  (:init
    (at bowl counter)
    (at cucumber counter)
    (at tomato counter)
    (at carrot counter)
    (at cutting_board counter)
    (at robot1 counter)
    (at robot2 counter)
    (free robot1)
    (holding robot2 knife)
    (has_knife robot2)
    (tool_available knife counter)
    (not (sliced cucumber))
    (not (sliced tomato))
    (not (sliced carrot))
  )
  (:goal (and
    (sliced cucumber)
    (sliced tomato)
    (sliced carrot)
    (at cucumber bowl)
    (at tomato bowl)
    (at carrot bowl)
  ))
)