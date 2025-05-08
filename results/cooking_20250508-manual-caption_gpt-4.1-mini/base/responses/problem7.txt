(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cucumber tomato carrot - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (at cucumber counter)
        (at tomato counter)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board counter)
        
        (is-whole cucumber)
        (is-whole tomato)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))
        (not (is-sliced carrot))
        
        (is-workspace cutting_board)
        
        (carry robot2 knife)
        (can-cut knife)
        (free robot1)
        
        (available cucumber)
        (available tomato)
        (available carrot)
        
        (available knife)
        (available spatula)
        (available spoon)
        (available bowl)
        (available cutting_board)
        (available counter)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced tomato)
        (is-sliced carrot)
        
        (at cucumber bowl)
        (at tomato bowl)
        (at carrot bowl)
    ))
)