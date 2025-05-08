(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cucumber - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (available cucumber)
        (carry robot2 knife)
        (can-cut knife)
        (free robot1)
        (at cucumber counter)
        (at bowl counter)
        (at knife robot2)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced cucumber)
            (at cucumber bowl)
        )
    )
)