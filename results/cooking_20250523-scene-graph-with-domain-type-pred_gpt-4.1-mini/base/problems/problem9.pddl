(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-workspace cutting_board)
        (at carrot counter)
        (at cucumber cutting_board)
        (at bowl counter)
        (available carrot)
        (available cucumber)
        (available bowl)
        (is-whole carrot)
        (is-sliced cucumber)
    )
    (:goal
        (and
            (is-sliced carrot)
            (at carrot bowl)
            (at cucumber bowl)
        )
    )
)