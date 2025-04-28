(define (problem cooking-slice-carrot)
(:domain cooking)
(:objects
    robot1 - robot
    carrot1 - vegetable
    carrot1_sliced - sliced_vegetable
    knife1 - tool
    bowl1 - bowl
    table - location
    cutting_board - location
)
(:init
    (at carrot1 table)
    (at knife1 cutting_board)
    (at bowl1 table)
    (clear carrot1)
    (clear knife1)
    (clear bowl1)
    (is_tool knife1)
    (is_bowl bowl1)
    (is_vegetable carrot1)
)
(:goal (and
    (is_sliced_vegetable carrot1_sliced)
    (sliced_from carrot1_sliced carrot1)
    (in_bowl carrot1_sliced bowl1)
))
)