(define (problem cooking) 
(:domain cooking) 
(:objects
    carrot - vegetable
    counter - location
    cutting_board - location
    bowl - location
    a_bot - robot
    b_bot - robot
    knife - tool
) 
(:init
    (available carrot)
    (is-whole carrot)
    (is-workspace cutting_board)
    (free a_bot)
    (carry b_bot knife)
    (can-cut knife)
    (at carrot counter)
) 
(:goal (and 
    (at carrot bowl)
    (is-sliced carrot)
)) 
)