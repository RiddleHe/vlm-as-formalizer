(define (problem cooking-slice-tomato)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato counter)
        (available tomato)
        (is-whole tomato)
        (not (is-sliced tomato))
        (at knife counter)
        (is-workspace cutting_board)
        (at bowl counter)
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
    ))
)