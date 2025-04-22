(define (problem cooking) 
(:domain cooking) 
(:objects
    robot1 - robot
    cucumber - vegetable
    tomato1 - vegetable
    tomato2 - vegetable
    cutting_board - location
    bowl - location
    knife - tool
) 
(:init
    (available cucumber)
    (available tomato1)
    (available tomato2)
    (is-whole cucumber)
    (is-whole tomato1)
    (is-whole tomato2)
    (at cucumber cutting_board)
    (at tomato1 cutting_board)
    (at tomato2 cutting_board)
    (free robot1)
    (can-cut knife)
) 
(:goal (and 
    (is-sliced cucumber)
    (is-sliced tomato1)
    (is-sliced tomato2)
    (at cucumber bowl)
    (at tomato1 bowl)
    (at tomato2 bowl)
)) 
)