(define (problem slice_and_place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber tomato - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (available cucumber)
        (available tomato)
        (available bowl)
        (available cutting_board)
        (available counter)
        (is-whole cucumber)
        (is-sliced tomato)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato cutting_board)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (at counter counter)
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