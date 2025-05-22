(define (problem slice_tomato)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        tomato - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole tomato)
        (not (is-sliced tomato))
        (at tomato counter)
        (at bowl counter)
        (at cutting_board counter)
        (is-workspace cutting_board)
        (available tomato)
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
    ))
)