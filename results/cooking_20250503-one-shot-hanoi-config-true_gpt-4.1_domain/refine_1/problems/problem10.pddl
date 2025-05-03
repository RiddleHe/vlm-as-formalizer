(define (problem cooking-tomato-carrot)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    knife1 - tool
    bowl1 - object
    tomato1 - vegetable
    carrot1 carrot2 - vegetable
    cutting_board - location
    table - location
    tray - location
)
(:init
    (handempty robot1)
    (handempty robot2)
    (is-knife knife1)
    (is-bowl bowl1)
    (is-tomato tomato1)
    (is-carrot carrot1)
    (is-carrot carrot2)

    (at knife1 cutting_board)
    (at carrot1 cutting_board)
    (at carrot2 cutting_board)
    (at tomato1 tray)
    (at bowl1 tray)
)
(:goal (and
    (sliced tomato1)
    (in-bowl tomato1)
    (in-bowl carrot1)
    (in-bowl carrot2)
))
)