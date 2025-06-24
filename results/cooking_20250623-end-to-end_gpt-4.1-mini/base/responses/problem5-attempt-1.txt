(define (problem slice-vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        bowl cutting_board - location
        tomato cucumber - vegetable
    )
    (:init
        (can-cut knife)
        (is-whole tomato)
        (is-whole cucumber)
        (available bowl)
        (available tomato)
        (available cucumber)
        (at tomato bowl)
        (at cucumber bowl)
        (at knife robot2)
        (carry robot2 knife)
        (free robot1)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
        (free robot1)
        (free robot2)
    ))
)