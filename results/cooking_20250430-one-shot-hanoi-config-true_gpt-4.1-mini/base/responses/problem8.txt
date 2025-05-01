(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        cucumber tomato bowl cutting_board knife - object
        cutting_board bowl - location
        knife - tool
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
        (available tomato)
        (available cucumber)
        
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