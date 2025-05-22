(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cutting_board bowl - location
        tomato cucumber - vegetable
    )
    (:init
        ; robots state
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        ; objects state
        (is-whole tomato)
        (is-whole cucumber)
        (not (is-sliced tomato))
        (not (is-sliced cucumber))
        (available tomato)
        (available cucumber)
        ; locations
        (at tomato cutting_board)
        (at cucumber cutting_board)
        (at bowl bowl)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced tomato)
        (is-sliced cucumber)
        (at tomato bowl)
        (at cucumber bowl)
    ))
)