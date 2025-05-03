(define (problem cooking-carrot-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot1 - vegetable
        knife1 - tool
        bowl1 - object
        table1 cutting_board1 - location
    )
    (:init
        (at carrot1 table1)
        (at bowl1 table1)
        (at knife1 cutting_board1)
        (knife knife1)
        (handempty robot1)
        (holding robot2 knife1)
        (free robot1)
    )
    (:goal (and (sliced carrot1) (in-bowl carrot1)))
)