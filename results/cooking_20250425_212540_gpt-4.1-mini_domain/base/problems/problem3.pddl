(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 - robot
        carrot - vegetable
        bowl - object
        knife - tool
        table - location
    )
    (:init
        (at carrot table)
        (at bowl table)
        (at knife table)
        (isVegetable carrot)
        (isTool knife)
        (isBowl bowl)
    )
    (:goal (and (sliced carrot) (at carrot bowl)))
)