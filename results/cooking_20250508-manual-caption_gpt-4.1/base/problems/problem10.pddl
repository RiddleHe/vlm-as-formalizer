(define (problem cooking-salad)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato carrot - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (is-whole tomato)
        (not (is-sliced tomato))
        (is-sliced carrot)
        (not (is-whole carrot))
        (available tomato)
        (available carrot)
        (can-cut knife)
        
        (at bowl counter)
        (at tomato counter)
        (at carrot cutting_board)
        (at knife robot2)    ; knife is being carried
        (is-workspace cutting_board)

        (free robot1)
        (carry robot2 knife)
        (not (free robot2))
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
        (at carrot bowl)
    ))
)