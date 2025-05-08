(define (problem cooking_task2)
(:domain cooking)
(:objects
    robot1 - robot
    robot2 - robot
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    cutting_board - location
    counter - location
    bowl - object
)
(:init
    (at bowl counter)
    (at cucumber counter)
    (at tomato cutting_board)
    (on_cutting_board tomato)
    (free robot1)
    (holding robot2 knife)
    (has_knife robot2 knife)
)
(:goal (and
    (sliced cucumber)
    (sliced tomato)
    (at cucumber bowl)
    (at tomato bowl)
))
)