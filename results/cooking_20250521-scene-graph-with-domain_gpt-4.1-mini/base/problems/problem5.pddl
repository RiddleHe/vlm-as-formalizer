(define (problem slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber tomato - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))
        (at cucumber cutting_board)
        (at tomato cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (available cucumber)
        (available tomato)
    )
    (:goal
        (and
            (is-sliced cucumber)
            (is-sliced tomato)
            (at cucumber bowl)
            (at tomato bowl)
        )
    )
)