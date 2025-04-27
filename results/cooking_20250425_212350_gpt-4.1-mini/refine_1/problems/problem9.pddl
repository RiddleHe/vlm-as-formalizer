(define (problem cooking_task2)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    carrot cucumber - vegetable
    knife - tool
    bowl cutting_board counter - location
)
(:init
    (free robot1)
    (free robot2)
    (available carrot)
    (available cucumber)
    (available knife)
    (can-cut knife)

    (is-whole carrot)
    (is-whole cucumber)
    (not (is-sliced carrot))
    (not (is-sliced cucumber))

    (at carrot cutting_board)
    (at cucumber counter)
    (at knife counter)
    (is-workspace cutting_board)
    (at bowl counter)
)
(:goal (and
    (is-sliced carrot)
    (at carrot bowl)
    (at cucumber bowl)
))
)