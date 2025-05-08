(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (is-whole carrot)
        (not (is-sliced carrot))
        (available carrot)
        (available knife)
        (can-cut knife)
        (at carrot counter)
        (at bowl counter)
        (at knife robot2) ; implicit since robot2 is holding knife
        (carry robot2 knife)
        (free robot1)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced carrot)
            (at carrot bowl)
        )
    )
)