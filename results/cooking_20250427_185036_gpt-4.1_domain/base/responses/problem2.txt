(define (problem cooking-tomato-slice-bowl)
(:domain cooking)
(:objects
    robot1 - robot
    tomato1 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board1 - location
    table1 - location
)
(:init
    (at tomato1 table1)
    (at bowl1 table1)
    (at knife1 cutting_board1)
    (clear tomato1)
    (clear knife1)
    (clear bowl1)
)
(:goal (and
    (sliced tomato1)
    (in tomato1 bowl1)
))
)