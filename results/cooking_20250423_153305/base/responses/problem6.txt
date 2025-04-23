(define (problem cooking-slice-cucumber-carrot)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 carrot1 - vegetable
    knife1 - tool
    bowl1 cutting_board1 counter1 - location
)
(:init
    (free robot1)
    (free robot2)
    (available cucumber1)
    (available carrot1)
    (available knife1)
    (can-cut knife1)
    (is-whole cucumber1)
    (is-whole carrot1)
    (not (is-sliced cucumber1))
    (not (is-sliced carrot1))
    (at cucumber1 counter1)
    (at carrot1 counter1)
    (at knife1 counter1)
    (at bowl1 counter1)
    (at cutting_board1 counter1)
    (is-workspace cutting_board1)
)
(:goal
    (and
        (is-sliced cucumber1)
        (is-sliced carrot1)
        (at cucumber1 bowl1)
        (at carrot1 bowl1)
    )
)
)