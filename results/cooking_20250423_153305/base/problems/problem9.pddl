(define (problem cooking) 
(:domain cooking) 
(:objects
    carrot1 - vegetable
    cucumber1 - vegetable
    cucumber2 - vegetable
    bowl1 - location
    cutting_board1 - location
    counter1 - location
    knife1 - tool
    robot1 - robot
    robot2 - robot
) 
(:init
    (available carrot1)
    (available cucumber1)
    (available cucumber2)
    (available knife1)
    (is-whole carrot1)
    (is-whole cucumber1)
    (is-whole cucumber2)
    (not is-sliced carrot1)
    (not is-sliced cucumber1)
    (not is-sliced cucumber2)
    (free robot1)
    (free robot2)
    (at carrot1 counter1)
    (at cucumber1 cutting_board1)
    (at cucumber2 cutting_board1)
    (at knife1 cutting_board1)
    (at bowl1 counter1)
    (is-workspace cutting_board1)
    (is-workspace counter1)
    (can-cut knife1)
) 
(:goal (and 
    (is-sliced carrot1)
    (at carrot1 bowl1)
    (at cucumber1 bowl1)
    (at cucumber2 bowl1)
)) 
)