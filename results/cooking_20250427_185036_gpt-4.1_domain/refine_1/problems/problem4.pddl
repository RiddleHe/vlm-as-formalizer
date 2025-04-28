(define (problem cooking-slice-and-bowl)
(:domain cooking)
(:objects
    robot1 - robot
    carrot1 - vegetable
    tomato1 - vegetable
    knife1 - tool
    board1 - tool
    bowl1 - bowl
    table1 - location
)
(:init
    (is-robot robot1)
    (is-knife knife1)
    (is-board board1)
    (is-bowl bowl1)
    (is-table table1)
    (at carrot1 table1)
    (clear carrot1)
    (at tomato1 table1)
    (clear tomato1)
    (at knife1 table1)
    (clear knife1)
    (at board1 table1)
    (clear board1)
    (at bowl1 table1)
    (clear bowl1)
)
(:goal (and
    (sliced carrot1)
    (sliced tomato1)
    (in-bowl carrot1)
    (in-bowl tomato1)
))
)