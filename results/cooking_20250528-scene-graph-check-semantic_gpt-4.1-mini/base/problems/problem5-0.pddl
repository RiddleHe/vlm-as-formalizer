(define (problem slice_and_place)
    (:domain cooking)
    (:objects
        robot1
        robot2 - robot
        knife - tool
        tomato
        cucumber - vegetable
        cutting_board
        bowl
        counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at tomato counter)
        (at cucumber counter)
        (at bowl counter)
        (at knife robot2)
        (is-whole tomato)
        (is-whole cucumber)
        (available tomato)
        (available cucumber)
        (available bowl)
        (is-workspace cutting_board)
        (at cutting_board cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
    ))
)