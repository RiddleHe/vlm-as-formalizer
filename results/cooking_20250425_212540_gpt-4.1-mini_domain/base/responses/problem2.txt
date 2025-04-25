(define (problem cooking_task1)
(:domain cooking)
(:objects
    robot1 - robot
    tomato - vegetable
    knife - tool
    chopping_board - location
    bowl - location
)
(:init
    (at tomato chopping_board)
    (at knife chopping_board)
    (isTool knife)
)
(:goal (and (sliced tomato) (at tomato bowl)))
)