(define (problem cooking1)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 tomato1 tomato2 - vegetable
    bowl1 - object
    knife1 - tool
    cutting_board1 counter1 - location
)
(:init
    (available cucumber1)
    (available tomato1)
    (available tomato2)
    (available knife1)
    (free robot1)
    (free robot2)
    (is-whole cucumber1)
    (is-whole tomato1)
    (is-whole tomato2)
    (can-cut knife1)
    (at cucumber1 counter1)
    (at bowl1 counter1)
    (at knife1 cutting_board1)
    (at tomato1 cutting_board1)
    (at tomato2 cutting_board1)
    (is-workspace cutting_board1)
    (is-workspace counter1)
)
(:goal
    (and
        (is-sliced cucumber1)
        (at cucumber1 bowl1)
        (at tomato1 bowl1)
        (at tomato2 bowl1)
    )
)
)