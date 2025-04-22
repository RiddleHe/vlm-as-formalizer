(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    bowl - location
    cutting_board - location
) 
(:init
    (is-whole cucumber)
    (is-whole tomato)
    (available cucumber)
    (available tomato)
    (available knife)
    (at cucumber cutting_board)
    (at tomato cutting_board)
    (at knife cutting_board)
    (free robot1)
    (is-workspace cutting_board)
) 
(:goal (and 
    (is-sliced cucumber)
    (is-sliced tomato)
    (at cucumber bowl)
    (at tomato bowl)
)) 
)