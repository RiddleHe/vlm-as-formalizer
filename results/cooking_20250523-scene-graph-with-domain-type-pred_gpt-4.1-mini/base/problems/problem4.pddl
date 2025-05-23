(define (problem cooking_slice_1)
    (:domain cooking)
    (:objects
        carrot tomato - vegetable
        knife - tool
        bowl cutting_board counter - location
        robot1 robot2 - robot
    )
    (:init
        (available carrot)
        (available tomato)
        (available bowl)
        (is-whole carrot)
        (is-whole tomato)
        (not (is-sliced carrot))
        (not (is-sliced tomato))
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (at carrot counter)
        (at tomato counter)
        (at cutting_board cutting_board)
        (at bowl bowl)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced carrot)
            (is-sliced tomato)
            (at carrot bowl)
            (at tomato bowl)
        )
    )
)