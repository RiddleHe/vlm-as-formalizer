(define (problem cooking) 
(:domain cooking) 
(:objects
    tomato - vegetable
    cutting_board - location
    bowl - location
    a_bot - robot
    knife - tool
) 
(:init
    (available tomato)
    (is-whole tomato)
    (is-workspace cutting_board)
    (free a_bot)
    (carry a_bot knife)
    (can-cut knife)
    (at tomato cutting_board)
) 
(:goal (and 
    (at tomato bowl)
    (is-sliced tomato)
)) 
)