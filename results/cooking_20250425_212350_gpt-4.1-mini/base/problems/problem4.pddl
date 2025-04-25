(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot tomato - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (free robot2)

        (available carrot)
        (available tomato)
        (available knife)

        (is-whole carrot)
        (is-whole tomato)

        (can-cut knife)

        (at carrot counter)
        (at tomato counter)
        (at knife robot1)
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