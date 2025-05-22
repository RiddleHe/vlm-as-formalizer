(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber tomatoes - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole tomatoes)
        (not (is-sliced cucumber))
        (not (is-sliced tomatoes))
        (at cucumber counter)
        (at tomatoes cutting_board)
        (at knife robot2)
        (at bowl counter)
        (is-workspace cutting_board)
        (available cucumber)
        (available tomatoes)
        (available bowl)
    )
    (:goal
        (and
            (is-sliced cucumber)
            (is-sliced tomatoes)
            (at cucumber bowl)
            (at tomatoes bowl)
        )
    )
)