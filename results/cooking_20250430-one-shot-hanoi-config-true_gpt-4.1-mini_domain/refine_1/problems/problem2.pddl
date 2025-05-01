(define (problem cooking_task_corrected)
(:domain cooking)
(:objects
    robot1
    robot2
    knife1 - tool
    tomato1 - vegetable
    bowl1 - bowl
    loc1 loc2 loc3 - location
)
(:init
    (holding robot1 knife1)
    (knife knife1)
    (tomato tomato1)
    (at tomato1 loc2)
    (bowl_obj bowl1)
    (at bowl1 loc1)
    (at robot1 loc3)
    (at robot2 loc3)
)
(:goal (and
    (sliced tomato1)
    (at tomato1 loc1)
))
)