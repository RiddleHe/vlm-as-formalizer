(define (problem cooking2)
    (:domain cooking)
    (:objects
        robot1 - robot
        knife - tool
        bowl cutting_board counter - location
        cucumber carrot tomato - vegetable
    )
    (:init
        (free robot1)
        (available knife)
        (can-cut knife)
        (at knife cutting_board)
        (at cucumber cutting_board)
        (is-whole cucumber)
        (at carrot cutting_board)
        (is-whole carrot)
        (at tomato cutting_board)
        (is-whole tomato)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (is-sliced tomato)
        (at cucumber bowl)
        (at carrot bowl)
        (at tomato bowl)
    ))
)