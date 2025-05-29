(define (problem slice_tomatoes_and_place)
    (:domain cooking)
    (:objects
        tomato carrot - vegetable
        knife - tool
        bowl cutting_board counter - location
        robot1 robot2 - robot
    )
    (:init
        (available tomato)
        (available carrot)
        (available bowl)
        (available cutting_board)
        (is-whole tomato)
        (is-sliced carrot)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato counter)
        (at carrot cutting_board)
        (at knife robot2)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
        (at carrot bowl)
    ))
)