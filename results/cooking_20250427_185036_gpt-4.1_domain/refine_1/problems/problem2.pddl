(define (problem cooking-tomato-slice-bowl)
(:domain cooking)
(:objects
    robot1 - robot
    tomato1 - vegetable
    sliced_tomato1 - sliced_vegetable
    knife1 - tool
    bowl1 - container
    cutting_board1 - location
    table1 - location
)
(:init
    (at tomato1 table1)
    (at bowl1 table1)
    (at knife1 cutting_board1)
    (clear tomato1)
    (clear bowl1)
    (clear sliced_tomato1)
    (is_slice_of sliced_tomato1 tomato1)
    (holding robot1 knife1)
)
(:goal (and
    (sliced tomato1)
    (in sliced_tomato1 bowl1)
))
)