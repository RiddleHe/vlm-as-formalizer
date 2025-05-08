(define (problem cooking_task1)
    (:domain cooking)
    (:objects 
        counter cutting_board bowl - location
        cucumber carrot - vegetable
        knife spatula - tool
        robot1 robot2 - robot
    )
    (:init
        (is-whole cucumber)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (available cucumber)
        (available carrot)
        (at cucumber counter)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board counter)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (at cucumber bowl)
        (at carrot bowl)
    ))
)