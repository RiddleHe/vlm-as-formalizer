(define (problem cooking-slice-place)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    tomato1 cucumber1 - vegetable
    bowl1 cutting_board1 counter1 - location
    knife1 - tool
)
(:init
    (is-workspace cutting_board1)
    (at cutting_board1 counter1)
    (at tomato1 counter1)
    (at cucumber1 counter1)
    (at bowl1 counter1)
    (at knife1 counter1)
    (available tomato1)
    (available cucumber1)
    (available knife1)
    (is-whole tomato1)
    (is-whole cucumber1)
    (can-cut knife1)
    (free robot1)
    (free robot2)
)
(:goal (and 
    (is-sliced tomato1)
    (is-sliced cucumber1)
    (at tomato1 bowl1)
    (at cucumber1 bowl1)
))
)