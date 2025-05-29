(define (problem cooking-slice-and-place)
    (:domain cooking)
    (:objects
        tomato carrot cucumber - vegetable
        knife spatula spoon - tool
        bowl cutting_board counter - location
        robot1 robot2 - robot
    )
    (:init
        (available tomato)
        (available carrot)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (available counter)
        (available spatula)
        (available spoon)
        (is-whole tomato)
        (is-whole carrot)
        (is-whole cucumber)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato counter)
        (at carrot counter)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced tomato)
            (is-sliced carrot)
            (is-sliced cucumber)
            (at tomato bowl)
            (at carrot bowl)
            (at cucumber bowl)
        )
    )
)