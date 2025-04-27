(define (problem cooking-slice-place-1)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber1 - vegetable
    tomato1 - vegetable
    bowl1 - tool
    knife1 - tool
    cuttingboard1 - location
    table1 - location
)
(:init
    (at cucumber1 table1)
    (at tomato1 table1)
    (at bowl1 table1)
    (at knife1 cuttingboard1)
    (is-knife knife1)
    (is-bowl bowl1)
    (clear cucumber1)
    (clear tomato1)
    (clear bowl1)
    (clear knife1)
)
(:goal (and 
    (sliced cucumber1)
    (sliced tomato1)
    (in-bowl cucumber1)
    (in-bowl tomato1)
))
)