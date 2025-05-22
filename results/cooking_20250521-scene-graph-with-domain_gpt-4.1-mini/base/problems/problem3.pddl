(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        bowl - location
        cutting_board black_mat center_platform - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (not (is-sliced carrot))
        (available carrot)
        (available bowl)
        (at carrot black_mat)
        (at bowl black_mat)
        (at cutting_board black_mat)
        (is-workspace black_mat)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
    ))
)