(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        counter cutting_board bowl - location
        cucumber tomato - vegetable
        knife spatula spoon - tool
        robot1 robot2 - robot
    )
    (:init
        (at cucumber counter)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (available cucumber)

        (at tomato counter)
        (is-whole tomato)
        (not (is-sliced tomato))
        (available tomato)

        (at bowl counter)

        (is-workspace cutting_board)

        (carry robot1 knife)
        (free robot2)

        (can-cut knife)
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