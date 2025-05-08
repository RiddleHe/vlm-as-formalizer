(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        tomato carrot - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (is-whole tomato)
        (is-whole carrot)
        (not (is-sliced tomato))
        (not (is-sliced carrot))
        (available tomato)
        (available carrot)
        (available knife)
        (carry robot2 knife)
        (free robot1)
        (can-cut knife)
        (at tomato counter)
        (at carrot counter)
        (at bowl counter)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced tomato)
            (is-sliced carrot)
            (at tomato bowl)
            (at carrot bowl)
        )
    )
)