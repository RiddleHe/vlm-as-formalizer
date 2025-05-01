(define (problem cooking_problem1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (not (is-sliced carrot))
        (available carrot)
        (at carrot counter)
        (at bowl counter)
        (is-workspace counter)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
    ))
)