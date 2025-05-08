(define (problem cooking-slice-vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber carrot - vegetable
        bowl cutting_board counter - location
        knife - tool
    )
    (:init
        (is-workspace cutting_board)
        (is-whole cucumber)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (available cucumber)
        (available carrot)
        (available bowl)

        (at cucumber counter)
        (at carrot counter)
        (at bowl counter)
        (at knife cutting_board)
        ; Place knife at cutting_board for initial state, then immediately assigned to robot2

        (not (free robot2))
        (carry robot2 knife)
        (free robot1)
        (can-cut knife)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (at cucumber bowl)
        (at carrot bowl)
    ))
)