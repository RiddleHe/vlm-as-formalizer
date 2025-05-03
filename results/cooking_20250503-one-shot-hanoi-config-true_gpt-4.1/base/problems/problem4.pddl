(define (problem cooking-slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot tomato - vegetable
        bowl cutting_board counter - location
        knife - tool
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at tomato counter)
        (at knife cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (is-whole carrot)
        (is-whole tomato)
        (available carrot)
        (available tomato)
        (available bowl)
        (available knife)
    )
    (:goal
        (and 
            (is-sliced carrot)
            (is-sliced tomato)
            (at carrot bowl)
            (at tomato bowl)
        )
    )
)