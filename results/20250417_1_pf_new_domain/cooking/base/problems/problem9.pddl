(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    carrot - vegetable
    cucumber - vegetable
    knife - tool
    bowl - location
    cutting_board - location
) 
(:init
    (available carrot)
    (available cucumber)
    (is-whole carrot)
    (is-whole cucumber)
    (free robot1)
    (at carrot cutting_board)
    (at cucumber cutting_board)
    (at knife cutting_board)
    (is-workspace cutting_board)
) 
(:goal (and 
    (is-sliced carrot)
    (is-sliced cucumber)
    (at cucumber bowl)
    (at carrot bowl)
)) 
)