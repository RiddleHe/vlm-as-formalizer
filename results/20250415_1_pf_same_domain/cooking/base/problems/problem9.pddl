(define (problem cooking) 
(:domain cooking) 
(:objects
    carrot - vegetable
    cucumber - vegetable
    cutting_board - location
    bowl - location
    a_bot - robot
    knife - tool
) 
(:init
    (available carrot)
    (available cucumber)
    (is-whole carrot)
    (is-whole cucumber)
    (is-workspace cutting_board)
    (free a_bot)
    (carry a_bot knife)
    (can-cut knife)
    (at carrot cutting_board)
    (at cucumber cutting_board)
) 
(:goal (and 
    (at carrot bowl)
    (at cucumber bowl)
    (is-sliced carrot)
    (is-sliced cucumber)
)) 
)