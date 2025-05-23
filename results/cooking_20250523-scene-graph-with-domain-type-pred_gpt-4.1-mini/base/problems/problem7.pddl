(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato carrot cucumber - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (available tomato)
        (available carrot)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (available counter)
        (is-whole tomato)
        (is-whole carrot)
        (is-whole cucumber)
        (at tomato counter)
        (at carrot counter)
        (at cucumber counter)
        (at knife robot2)
        (at bowl counter)
        (at cutting_board counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced carrot)
        (is-sliced cucumber)
        (at tomato bowl)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)