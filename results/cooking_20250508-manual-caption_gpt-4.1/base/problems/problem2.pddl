(define (problem cooking-slice-tomato)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato - vegetable
        knife - tool
        bowl - object
        counter cutting_board - location
    )
    (:init
        (is-whole tomato)
        (not (is-sliced tomato))
        (at tomato counter)
        (at bowl counter)
        (carry robot2 knife)
        (can-cut knife)
        (free robot1)
        (not (free robot2))
        (is-workspace cutting_board)
        (is-workspace counter)
        (available tomato)
        (available bowl)
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
    ))
)