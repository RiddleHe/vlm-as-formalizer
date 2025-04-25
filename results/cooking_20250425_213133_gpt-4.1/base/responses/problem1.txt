(define (problem cooking-cucumber-slice)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 - vegetable
    knife1 - tool
    bowl1 cuttingboard1 counter1 - location
)
(:init
    (at cucumber1 counter1)
    (available cucumber1)
    (is-whole cucumber1)
    (at knife1 counter1)
    (available knife1)
    (can-cut knife1)
    (at bowl1 counter1)
    (at cuttingboard1 counter1)
    (is-workspace cuttingboard1)
    (free robot1)
    (free robot2)
)
(:goal (and
    (is-sliced cucumber1)
    (at cucumber1 bowl1)
))
)