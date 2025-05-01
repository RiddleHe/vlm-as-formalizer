(define (problem cooking_problem2)
(:domain cooking)
(:objects
    robot1
    robot2
    knife - tool
    carrot tomato - vegetable
    bowl cutting_board counter - location
)
(:init
    (free robot1)
    (free robot2)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (is-whole tomato)
    (not (is-sliced carrot))
    (not (is-sliced tomato))
    (at carrot counter)
    (at tomato counter)
    (at bowl counter)
    (at knife robot2)
    (is-workspace counter)
    (not (available knife))
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