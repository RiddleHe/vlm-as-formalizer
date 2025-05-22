(define (problem cooking_slice_carrot_tomato)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        carrot tomato - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (not (is-sliced carrot))
        (is-whole tomato)
        (not (is-sliced tomato))
        (at carrot cutting_board)
        (at tomato cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (is-sliced tomato)
        (at carrot bowl)
        (at tomato bowl)
    ))
)