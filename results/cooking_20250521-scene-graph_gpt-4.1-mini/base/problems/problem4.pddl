(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        carrot tomato - vegetable
        bowl cutting_board counter - location
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
        (available bowl)
        (at carrot counter)
        (at tomato counter)
        (at bowl counter)
        (at cutting_board counter)
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