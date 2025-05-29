(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        cutting_board bowl counter - location
        cucumber carrot - vegetable
        knife - tool
        robot1 robot2 - robot
    )
    (:init
        (available cucumber)
        (available carrot)
        (available bowl)
        (available knife)
        (is-whole cucumber)
        (is-whole carrot)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at cucumber counter)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (at cucumber bowl)
        (at carrot bowl)
    ))
)