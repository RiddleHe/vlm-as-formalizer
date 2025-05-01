(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula - tool
        tomato - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (is-whole tomato)
        (not (is-sliced tomato))
        (available tomato)
        (at tomato counter)
        (at bowl counter)
        (is-workspace counter)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
        )
    )
)