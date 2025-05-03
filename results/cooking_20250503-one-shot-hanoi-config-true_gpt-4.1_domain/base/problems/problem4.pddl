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
        (at carrot1 board1)
        (at tomato1 board1)
        (at knife1 board1)
        (at bowl1 table1)
        (on_board carrot1)
        (on_board tomato1)
        (is_knife knife1)
        (is_bowl bowl1)
        (is_vegetable carrot1)
        (is_vegetable tomato1)
        (handempty robot1)
        (holding robot2 knife1)
    )
    (:goal (and 
        (is_sliced carrot1)
        (is_sliced tomato1)
        (in_bowl carrot1)
        (in_bowl tomato1)
    ))
)