(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot tomato - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (available carrot)
        (available tomato)
        (available bowl)
        (is-whole tomato)
        (is-sliced carrot)
        (at carrot cutting_board)
        (at tomato counter)
        (at bowl counter)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at carrot bowl)
            (at tomato bowl)
        )
    )
)