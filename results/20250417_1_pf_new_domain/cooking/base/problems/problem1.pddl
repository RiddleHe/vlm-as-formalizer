(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    cucumber - vegetable
    knife - tool
    bowl - location
    cutting_board - location
) 
(:init
    (available cucumber)
    (is-whole cucumber)
    (free robot1)
    (can-cut knife)
    (at cucumber cutting_board)
    (is-workspace cutting_board)
    (at knife cutting_board)
) 
(:goal (and 
    (is-sliced cucumber)
    (at cucumber bowl)
    (available cucumber)
)) 
)