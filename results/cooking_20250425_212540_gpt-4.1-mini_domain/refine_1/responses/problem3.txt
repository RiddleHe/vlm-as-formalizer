(define (problem cooking2)
(:domain cooking)
(:objects
    robot1 - robot
    carrot - vegetable
    bowl1 - bowl
    knife1 - tool
    table - location
)
(:init
    (at carrot table)
    (at bowl1 table)
    (at knife1 table)
    (isVegetable carrot)
    (isTool knife1)
    (isBowl bowl1)
)
(:goal (and (sliced carrot) (at carrot bowl1)))
)