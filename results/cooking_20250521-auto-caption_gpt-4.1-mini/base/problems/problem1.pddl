(define (problem slice-cucumber)
    (:domain cooking)
    (:objects
        robot1
        robot2
        cucumber - vegetable
        knife - tool
        cutting_board bowl - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (at cucumber cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (available cucumber)
        (available bowl)
    )
    (:goal (and
        (is-sliced cucumber)
        (at cucumber bowl)
    ))
)