(define (problem cook1)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        tomato - vegetable
        carrot - vegetable
        bowl - location
        cutting_board - location
        counter - location
    )
    (:init
        (carry robot1 knife)
        (can-cut knife)
        (free robot2)
        (is-whole tomato)
        (is-whole carrot)
        (not (is-sliced tomato))
        (not (is-sliced carrot))
        (at tomato counter)
        (at carrot cutting_board)
        (at bowl counter)
        (available tomato)
        (available carrot)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced carrot)
        (at tomato bowl)
        (at carrot bowl)
    ))
)