(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato - vegetable
        knife - tool
        bowl - location
        counter - location
        cutting_board - location
    )
    (:init
        (is-whole tomato)
        (not (is-sliced tomato))
        (available tomato)
        (available knife)
        (carry robot2 knife)
        (free robot1)
        (can-cut knife)
        (at tomato counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal 
        (and 
            (is-sliced tomato)
            (at tomato bowl)
        )
    )
)