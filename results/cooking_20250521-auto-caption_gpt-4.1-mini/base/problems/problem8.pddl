(define (problem slice-cucumber-and-place)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        bowl - location
        cutting_board - location
        counter - location
        cucumber tomato - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at cucumber counter)
        (at tomato cutting_board)
        (is-whole cucumber)
        (is-whole tomato)
        (is-workspace cutting_board)
        (available cucumber)
        (available tomato)
    )
    (:goal (and
        (is-sliced cucumber)
        (not (is-whole cucumber))
        (is-sliced tomato)
        (not (is-whole tomato))
        (at cucumber bowl)
        (at tomato bowl)
    ))
)