(define (problem slice_and_place_veg)
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
        (available tomato)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (is-whole tomato)
        (is-whole cucumber)
        (not (is-sliced tomato))
        (not (is-sliced cucumber))
        (at tomato counter)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
    ))
)