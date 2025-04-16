(define (problem cooking) 
(:domain cooking) 
(:objects
    cucumber - vegetable
    cutting_board - location
    bowl - location
    a_bot - robot
    knife - tool
) 
(:init
    (available cucumber)
    (is-whole cucumber)
    (is-workspace cutting_board)
    (free a_bot)
    (carry a_bot knife)
    (can-cut knife)
    (at cucumber cutting_board)
) 
(:goal (and 
    (at cucumber bowl)
    (is-sliced cucumber)
)) 
)