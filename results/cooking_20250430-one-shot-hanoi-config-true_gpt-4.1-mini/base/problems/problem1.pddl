(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        cucumber - vegetable
        bowl - location
        cutting_board - location
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (at cucumber cutting_board)
        (is-workspace cutting_board)
        (at bowl bowl)
        (available cucumber)
        (available knife)
    )
    (:goal 
        (and 
            (is-sliced cucumber)
            (at cucumber bowl)
        )
    )
)