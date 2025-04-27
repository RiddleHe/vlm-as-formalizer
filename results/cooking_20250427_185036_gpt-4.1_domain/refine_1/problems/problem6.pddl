(define (problem cooking-slice-bowl-2)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber1 - vegetable
    carrot1 - vegetable
    knife1 - tool
    bowl1 - object
    board1 - object
    table1 - location
    board-loc - location
    bowl-loc - location
)
(:init
    (at cucumber1 table1)
    (at carrot1 table1)
    (at knife1 board-loc)
    (at board1 board-loc)
    (at bowl1 bowl-loc)
    (unsliced cucumber1)
    (unsliced carrot1)
    (is-bowl bowl1)
    (is-cutting-board board1)
    (is-knife knife1)
    (handempty robot1)
)
(:goal (and
    (sliced cucumber1)
    (sliced carrot1)
    (at cucumber1 bowl-loc)
    (at carrot1 bowl-loc)
))
)