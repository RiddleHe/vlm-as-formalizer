(define (problem slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cutting_board bowl counter - location
        cucumber tomato - vegetable
        knife - tool
    )
    (:init
        (available tomato)
        (available cucumber)
        (available bowl)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (at tomato cutting_board)
        (at cucumber counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced cucumber)
            (at cucumber bowl)
            (at tomato bowl)
        )
    )
)