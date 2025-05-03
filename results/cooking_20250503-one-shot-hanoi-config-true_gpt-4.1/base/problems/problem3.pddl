(define (problem slice-carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        bowl cutting_board counter - location
        knife - tool
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (not (is-sliced carrot))
        (at carrot counter)
        (at cutting_board cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (available carrot)
        (available bowl)
        (available cutting_board)
        (available knife)
    )
    (:goal (and 
        (is-sliced carrot)
        (at carrot bowl)
    ))
)