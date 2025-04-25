(define (problem cooking1)
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
        (at knife counter)
        (at bowl counter)
        (at cutting_board counter)
        (at cucumber counter)
        (is-whole cucumber)
        (at carrot counter)
        (is-whole carrot)
        (at tomato counter)
        (is-whole tomato)
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