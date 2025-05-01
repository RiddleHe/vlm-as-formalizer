(define (problem cooking_problem2)
(:domain cooking)
(:objects 
    robot1 - robot
    robot2 - robot
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    bowl - bowl
    table - location
)
(:init
    (at cucumber table)
    (at tomato table)
    (at bowl table)
    (is_tool knife)
    (is_knife knife)
    (holding robot1 knife)
)
(:goal (and
    (sliced cucumber)
    (sliced tomato)
    (in_bowl cucumber bowl)
    (in_bowl tomato bowl)
))
)