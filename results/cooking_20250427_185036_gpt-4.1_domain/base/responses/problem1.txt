(define (problem cooking1)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber1 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board1 - location
    counter1 - location
)
(:init
    (at cucumber1 counter1)
    (at knife1 cutting_board1)
    (at bowl1 counter1)
    (is-bowl bowl1)
    (is-knife knife1)
    (is-cucumber cucumber1)
    (clear cucumber1)
    (clear knife1)
    (clear bowl1)
    (empty-hand robot1)
)
(:goal (and
    (sliced cucumber1)
    (in-bowl cucumber1)
))
)