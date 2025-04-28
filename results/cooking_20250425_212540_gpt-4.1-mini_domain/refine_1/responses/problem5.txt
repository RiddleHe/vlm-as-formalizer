(define (problem slice_veg_in_bowl)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    bowl1 - bowl
    table - location
)
(:init
    (at cucumber table)
    (at tomato table)
    (at knife table)
    (isTool knife)
    (isBowl bowl1)
    (not (holding robot1 cucumber))
    (not (holding robot1 tomato))
    (not (holding robot1 knife))
)
(:goal (and
    (sliced cucumber)
    (sliced tomato)
    (at cucumber bowl1)
    (at tomato bowl1)
))
)