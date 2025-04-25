(define (problem salad-slicing-1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber1 tomato1 - vegetable
        knife1 - tool
        bowl1 cutting_board1 counter1 - location
    )
    (:init
        (available cucumber1)
        (available tomato1)
        (available knife1)

        (is-whole cucumber1)
        (is-whole tomato1)
        (not (is-sliced cucumber1))
        (not (is-sliced tomato1))

        (free robot1)
        (free robot2)

        (can-cut knife1)

        (at cucumber1 counter1)
        (at tomato1 counter1)
        (at knife1 counter1)

        (at bowl1 counter1)
        (at cutting_board1 counter1)

        (is-workspace cutting_board1)
    )
    (:goal 
        (and
            (is-sliced cucumber1)
            (is-sliced tomato1)
            (at cucumber1 bowl1)
            (at tomato1 bowl1)
        )
    )
)