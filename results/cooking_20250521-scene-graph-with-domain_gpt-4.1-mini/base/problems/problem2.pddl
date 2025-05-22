(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife1 - tool
        tomato1 - vegetable
        bowl1 - location
        cutting_board1 - location
        counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife1)
        (can-cut knife1)
        (is-whole tomato1)
        (available bowl1)
        (at tomato1 counter)
        (at bowl1 counter)
        (at cutting_board1 counter)
        (is-workspace cutting_board1)
    )
    (:goal (and
        (is-sliced tomato1)
        (at tomato1 bowl1)
    ))
)