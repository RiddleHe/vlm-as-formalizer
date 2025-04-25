(define (problem cooking1)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    tomato1 - vegetable
    carrot1 - vegetable
    cutting_board bowl counter - location
    knife1 - tool
)

(:init
    ; Object locations
    (at tomato1 counter)
    (at carrot1 cutting_board)
    (at knife1 cutting_board)
    (at bowl counter)
    (is-workspace cutting_board)

    ; Object states
    (is-whole tomato1)
    (is-sliced carrot1)
    (available tomato1)
    (available carrot1)
    (available knife1)
    (available bowl)
    (can-cut knife1)

    ; Robot states
    (free robot1)
    (free robot2)
)

(:goal
    (and
        (is-sliced tomato1)
        (at tomato1 bowl)
        (at carrot1 bowl)
    )
)
)