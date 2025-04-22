(define (problem cooking) 
(:domain cooking) 
(:objects
    cucumber - vegetable
    tomato - vegetable
    carrot - vegetable
    cutting_board - location
    bowl - location
    a_bot - robot
    b_bot - robot
    knife - tool
) 
(:init
    (available cucumber)
    (available tomato)
    (available carrot)
    (is-whole cucumber)
    (is-whole tomato)
    (is-whole carrot)
    (is-workspace cutting_board)
    (free a_bot)
    (carry b_bot knife)
    (can-cut knife)
    (at cucumber cutting_board)
    (at tomato cutting_board)
    (at carrot cutting_board)
) 
(:goal (and 
    (at cucumber bowl)
    (is-sliced cucumber)
    (at tomato bowl)
    (is-sliced tomato)
    (at carrot bowl)
    (is-sliced carrot)
)) 
)