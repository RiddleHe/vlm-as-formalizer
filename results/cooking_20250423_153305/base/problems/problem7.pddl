(define (problem cooking-salad)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife1 - tool
        cucumber1 carrot1 tomato1 - vegetable
        cutting_board1 bowl1 counter1 - location
    )
    (:init
        (available cucumber1)
        (available carrot1)
        (available tomato1)
        (available knife1)
        (free robot1)
        (free robot2)
        (can-cut knife1)
        (is-whole cucumber1)
        (is-whole carrot1)
        (is-whole tomato1)
        (is-workspace cutting_board1)
        (at cucumber1 counter1)
        (at carrot1 counter1)
        (at tomato1 counter1)
        (at bowl1 counter1)
        (at knife1 counter1)
        (at robot1 counter1)
        (at robot2 counter1)
    )
    (:goal 
        (and
            (is-sliced cucumber1)
            (is-sliced carrot1)
            (is-sliced tomato1)
            (at cucumber1 bowl1)
            (at carrot1 bowl1)
            (at tomato1 bowl1)
        )
    )
)