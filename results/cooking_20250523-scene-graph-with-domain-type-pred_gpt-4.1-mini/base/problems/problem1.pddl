(define (problem slice_cucumber)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (available counter)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced cucumber)
            (at cucumber bowl)
        )
    )
)