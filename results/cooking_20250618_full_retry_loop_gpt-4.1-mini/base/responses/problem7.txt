(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife spatula spoon - tool
        cutting_board bowl counter - location
        cucumber carrot tomato - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-workspace cutting_board)
        (at cucumber counter)
        (at carrot counter)
        (at tomato counter)
        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)
        (available cucumber)
        (available carrot)
        (available tomato)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (is-sliced tomato)
        (at cucumber bowl)
        (at carrot bowl)
        (at tomato bowl)
    ))
)