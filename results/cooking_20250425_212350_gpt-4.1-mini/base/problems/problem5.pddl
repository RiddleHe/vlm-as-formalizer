(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 - robot
        knife - tool
        cucumber tomato - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (can-cut knife)
        (available knife)
        (available cucumber)
        (available tomato)
        (is-whole cucumber)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))
        (at cucumber counter)
        (at tomato counter)
        (at bowl counter)
        (at knife cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced tomato)
        (at cucumber bowl)
        (at tomato bowl)
    ))
)