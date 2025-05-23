(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1
        robot2
        carrot - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available carrot)
        (available bowl)
        (is-whole carrot)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at knife robot2)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and 
        (is-sliced carrot)
        (at carrot bowl)
    ))
)