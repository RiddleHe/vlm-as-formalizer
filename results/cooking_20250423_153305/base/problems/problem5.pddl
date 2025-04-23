(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    robot2 - robot
    tomato1 - vegetable
    cucumber1 - vegetable
    bowl1 - object
    knife1 - tool
    cutting_board1 - location
    counter1 - location
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
    (available bowl1)
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