(define (problem slice_tomato)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available tomato)
        (available bowl)
        (available cutting_board)
        (available counter)
        (is-whole tomato)
        (not (is-sliced tomato))
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato counter)
        (at cutting_board cutting_board)
        (at bowl bowl)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
        )
    )
)