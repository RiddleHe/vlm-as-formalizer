(define (problem slice-tomato-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    tomato1 - vegetable
    bowl1 - object
    knife1 - tool
    cutting_board1 counter1 - location
)
(:init
    (available tomato1)
    (available knife1)
    (is-whole tomato1)
    (not (is-sliced tomato1))
    (free robot1)
    (free robot2)
    (can-cut knife1)
    (at tomato1 counter1)
    (at knife1 counter1)
    (at bowl1 counter1)
    (is-workspace cutting_board1)
    (at cutting_board1 counter1)
)
(:goal (and
    (is-sliced tomato1)
    (at tomato1 bowl1)
))
)