(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cutting_board bowl counter - location
        carrot tomato - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (is-whole tomato)
        (not (is-sliced carrot))
        (not (is-sliced tomato))
        (available carrot)
        (available tomato)
        (at carrot counter)
        (at tomato counter)
        (at cutting_board cutting_board)
        (at bowl counter)
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