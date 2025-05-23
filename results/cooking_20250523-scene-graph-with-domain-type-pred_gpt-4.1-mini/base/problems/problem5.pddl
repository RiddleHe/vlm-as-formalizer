(define (problem slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole tomato)
        (is-whole cucumber)
        (available tomato)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (at tomato counter)
        (at cucumber counter)
        (at knife robot2)
        (at cutting_board counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
    ))
)