(define (problem cooking-salad)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        tomato cucumber - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)

        (at tomato counter)
        (at cucumber counter)
        (at knife cutting_board)
        (at bowl counter)
        (at cutting_board cutting_board)

        (is-whole tomato)
        (is-whole cucumber)
        (not (is-sliced tomato))
        (not (is-sliced cucumber))
        (available tomato)
        (available cucumber)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
    ))
)