(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available carrot)
        (available bowl)
        (available cutting_board)
        (available counter)
        (is-whole carrot)
        (not (is-sliced carrot))
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal 
        (and
            (is-sliced carrot)
            (at carrot bowl)
        )
    )
)