(define (problem cooking-slice-bowl-2)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber1 - vegetable
    carrot1 - vegetable
    knife1 - tool
    bowl1 - object
    board1 - object
    board-loc - location
    bowl-loc - location
)
(:init
    (at cucumber1 board-loc)
    (at carrot1 board-loc)
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
    (in-bowl cucumber1)
    (in-bowl carrot1)
))
)