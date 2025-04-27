(define (problem cooking-slice-place)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 carrot1 - vegetable
    bowl1 - object
    knife1 - tool
    cuttingboard1 counter1 - location
)
(:init
    (available cucumber1)
    (available carrot1)
    (available knife1)
    (free robot1)
    (free robot2)
    (is-whole cucumber1)
    (not (is-sliced cucumber1))
    (is-whole carrot1)
    (not (is-sliced carrot1))
    (can-cut knife1)
    (is-workspace cuttingboard1)
    (at cucumber1 cuttingboard1)
    (at carrot1 cuttingboard1)
    (at knife1 cuttingboard1)
    (at bowl1 counter1)
)
(:goal (and 
    (is-sliced cucumber1)
    (is-sliced carrot1)
    (at cucumber1 bowl1)
    (at carrot1 bowl1)
))
)