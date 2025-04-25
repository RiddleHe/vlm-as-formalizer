(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife1 - tool
        carrot1 tomato1 - vegetable
        cutting_board1 bowl1 counter1 - location
    )
    (:init
        (available carrot1)
        (available tomato1)
        (available knife1)
        (is-whole carrot1)
        (is-whole tomato1)
        (can-cut knife1)
        (free robot1)
        (free robot2)
        (at knife1 counter1)
        (at carrot1 counter1)
        (at tomato1 counter1)
        (at bowl1 counter1)
        (at cutting_board1 counter1)
        (is-workspace cutting_board1)
    )
    (:goal (and
        (is-sliced carrot1)
        (is-sliced tomato1)
        (at carrot1 bowl1)
        (at tomato1 bowl1)
    ))
)