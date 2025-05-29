(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        counter cutting_board bowl - location
    )
    (:init
        (available carrot)
        (available bowl)
        (is-whole carrot)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
    ))
)