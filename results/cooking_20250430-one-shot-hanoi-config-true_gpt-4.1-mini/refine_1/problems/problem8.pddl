(define (problem cooking_task2)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber tomato - vegetable
    knife - tool
    bowl cutting_board counter - location
)
(:init
    (free robot1)
    (free robot2)

    (carry robot1 knife)
    (can-cut knife)

    (at cucumber cutting_board)
    (at tomato cutting_board)
    (at bowl counter)

    (is-whole cucumber)
    (is-whole tomato)
    (available cucumber)
    (available tomato)

    (is-workspace cutting_board)
)
(:goal
    (and
        (is-sliced cucumber)
        (not (is-whole cucumber))
        (at cucumber bowl)
        (at tomato bowl)
    )
)
)