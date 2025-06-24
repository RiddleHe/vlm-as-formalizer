(define (problem slice_and_place)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        cucumber carrot tomato - vegetable
        knife - tool
        cutting_board bowl workspace - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (not (is-sliced tomato))
        (available cucumber)
        (available carrot)
        (available tomato)
        (at cucumber workspace)
        (at carrot workspace)
        (at tomato workspace)
        (at cutting_board workspace)
        (is-workspace workspace)
        (at bowl workspace)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (is-sliced tomato)
        (at cucumber bowl)
        (at carrot bowl)
        (at tomato bowl)
    ))
)