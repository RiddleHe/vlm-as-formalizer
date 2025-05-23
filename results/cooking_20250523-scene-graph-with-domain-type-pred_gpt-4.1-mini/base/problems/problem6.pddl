(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        carrot cucumber - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (is-whole cucumber)
        (not (is-sliced carrot))
        (not (is-sliced cucumber))
        (available carrot)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (available counter)
        (at carrot counter)
        (at cucumber counter)
        (at bowl counter)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced carrot)
            (is-sliced cucumber)
            (at carrot bowl)
            (at cucumber bowl)
        )
    )
)