(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    carrot - vegetable
    tomato - vegetable
    knife - tool
    bowl - location
    cutting_board - location
) 
(:init
    (available carrot)
    (available tomato)
    (is-whole carrot)
    (is-whole tomato)
    (free robot1)
    (at carrot cutting_board)
    (at tomato cutting_board)
    (at knife cutting_board)
    (can-cut knife)
    (is-workspace cutting_board)
    (is-workspace bowl)
) 
(:goal (and 
    (at carrot bowl)
    (at tomato bowl)
    (is-sliced carrot)
    (is-sliced tomato)
)) 
)