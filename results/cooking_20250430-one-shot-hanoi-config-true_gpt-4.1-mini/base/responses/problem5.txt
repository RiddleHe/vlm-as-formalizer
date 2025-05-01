(define (problem slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cucumber tomato - vegetable
        bowl cuttingboard counter - location
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))
        (at cucumber counter)
        (at tomato counter)
        (at bowl counter)
        (is-workspace counter)
        (available cucumber)
        (available tomato)
        (available bowl)
    )
    (:goal 
        (and 
            (is-sliced cucumber)
            (is-sliced tomato)
            (at cucumber bowl)
            (at tomato bowl)
        )
    )
)