(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    robot2 - robot
    tomato1 - vegetable
    knife1 - tool
    bowl1 - location
    cutting_board1 - location
    counter1 - location
) 
(:init
    (at tomato1 counter1)
    (at knife1 counter1)
    (at bowl1 counter1)
    (at cutting_board1 counter1)
    (free robot1)
    (free robot2)
    (available tomato1)
    (available knife1)
    (is-whole tomato1)
    (can-cut knife1)
    (is-workspace cutting_board1)
) 
(:goal (and 
    (is-sliced tomato1)
    (at tomato1 bowl1)
)) 
)