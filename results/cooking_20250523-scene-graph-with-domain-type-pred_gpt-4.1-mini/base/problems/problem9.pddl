(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available carrot)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (is-whole carrot)
        (is-whole cucumber)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at cucumber cutting_board)
        (at bowl counter)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced carrot)
            (at carrot bowl)
            (at cucumber bowl)
        )
    )
)