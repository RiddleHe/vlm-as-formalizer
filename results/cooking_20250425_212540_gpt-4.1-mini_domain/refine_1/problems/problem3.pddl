(define (problem cooking1)
(:domain cooking)
(:objects
    robot1 - robot
    carrot - vegetable
    bowl - object
    cleaver - tool
    table - location
)
(:init
    (at carrot table)
    (at bowl table)
    (at cleaver table)
    (at-robot robot1 table)
    (isVegetable carrot)
    (isTool cleaver)
    (isBowl bowl)
)
(:goal (and (sliced carrot) (at carrot bowl)))
)