(define (problem cooking) 
(:domain cooking) 
(:objects
    tomato - vegetable
    carrot - vegetable
    cutting_board - location
    bowl - location
    a_bot - robot
    b_bot - robot
    knife - tool
) 
(:init
    (available tomato)
    (available carrot)
    (is-whole tomato)
    (is-whole carrot)
    (is-workspace cutting_board)
    (free a_bot)
    (carry b_bot knife)
    (can-cut knife)
    (at tomato cutting_board)
    (at carrot cutting_board)
) 
(:goal (and 
    (at tomato bowl)
    (at carrot bowl)
    (is-sliced tomato)
    (is-sliced carrot)
)) 
)