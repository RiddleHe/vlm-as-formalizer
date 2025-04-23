(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    robot2 - robot
    tomato1 - vegetable
    tomato2 - vegetable
    cucumber1 - vegetable
    knife1 - tool
    cutting_board1 - location
    bowl1 - location
    counter1 - location
) 
(:init
    (available tomato1)
    (available tomato2)
    (available cucumber1)
    (available knife1)
    (is-whole tomato1)
    (is-whole tomato2)
    (is-whole cucumber1)
    (not is-sliced tomato1)
    (not is-sliced tomato2)
    (not is-sliced cucumber1)
    (free robot1)
    (free robot2)
    (can-cut knife1)
    (at tomato1 cutting_board1)
    (at tomato2 cutting_board1)
    (at knife1 cutting_board1)
    (at cucumber1 counter1)
    (at bowl1 counter1)
    (is-workspace cutting_board1)
    (is-workspace counter1)
) 
(:goal (and 
    (is-sliced cucumber1)
    (at cucumber1 bowl1)
    (at tomato1 bowl1)
    (at tomato2 bowl1)
)) 
)