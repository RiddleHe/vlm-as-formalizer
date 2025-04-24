(define (problem cooking-tomato-carrot-slice-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    tomato1 - vegetable
    carrot1 - vegetable
    knife1 - tool
    bowl1 - location
    cutting_board1 - location
    counter1 - location
)

(:init
    (free robot1)
    (free robot2)
    (available tomato1)
    (available carrot1)
    (available knife1)
    (is-whole tomato1)
    (is-whole carrot1)
    (can-cut knife1)
    (at tomato1 counter1)
    (at carrot1 cutting_board1)
    (at knife1 cutting_board1)
    (at bowl1 counter1)
    (is-workspace cutting_board1)
    (is-workspace counter1)
)

(:goal
    (and
        (is-sliced tomato1)
        (at tomato1 bowl1)
        (at carrot1 bowl1)
    )
)
)