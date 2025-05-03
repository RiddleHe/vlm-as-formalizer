(define (problem cook-slice-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    carrot1 - vegetable
    tomato1 - vegetable
    knife1 - tool
    bowl1 - object
    board1 - location
    table1 - location
)
(:init
    ;; vegetables start on the table
    (at carrot1 table1)
    (at tomato1 table1)
    ;; knife is being held by robot2, not on any location
    (holding robot2 knife1)
    (at bowl1 table1)
    ;; the board is a valid location, can be used for slicing
    ;; robot1 is free for actions
    (handempty robot1)
    ;; object typing
    (is_knife knife1)
    (is_bowl bowl1)
    (is_vegetable carrot1)
    (is_vegetable tomato1)
)
(:goal (and 
    (is_sliced carrot1)
    (is_sliced tomato1)
    (in_bowl carrot1)
    (in_bowl tomato1)
))
)