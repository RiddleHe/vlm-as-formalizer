(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    robot2 - robot
    cucumber1 - vegetable
    knife1 - tool
    bowl1 - location
    cutting_board1 - location
    counter - location
) 
(:init
    (is-workspace cutting_board1)
    (at cucumber1 cutting_board1)
    (at knife1 cutting_board1)
    (at bowl1 counter)
    (is-whole cucumber1)
    (available cucumber1)
    (available knife1)
    (can-cut knife1)
    (free robot1)
    (free robot2)
) 
(:goal (and 
    (is-sliced cucumber1)
    (at cucumber1 bowl1)
)) 
)