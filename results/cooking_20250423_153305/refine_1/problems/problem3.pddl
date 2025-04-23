(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    robot2 - robot
    carrot1 - vegetable
    knife1 - tool
    bowl1 - location
    cutting_board1 - location
    counter1 - location
) 
(:init
    (available carrot1)
    (available knife1)
    (is-whole carrot1)
    (at carrot1 counter1)
    (at bowl1 counter1)
    (at knife1 counter1)
    (at cutting_board1 counter1)
    (is-workspace cutting_board1)
    (free robot1)
    (free robot2)
    (can-cut knife1)
) 
(:goal (and 
    (is-sliced carrot1)
    (at carrot1 bowl1)
)) 
)