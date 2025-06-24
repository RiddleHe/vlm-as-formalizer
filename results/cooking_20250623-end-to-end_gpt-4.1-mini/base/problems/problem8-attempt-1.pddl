(define (problem slice_cucumber_and_place)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        cucumber tomato1 tomato2 - vegetable
        bowl cutting_board workspace - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (is-whole tomato1)
        (not (is-sliced tomato1))
        (is-whole tomato2)
        (not (is-sliced tomato2))
        (available cucumber)
        (available tomato1)
        (available tomato2)
        (at cucumber workspace)
        (at tomato1 workspace)
        (at tomato2 workspace)
        (at bowl workspace)
        (at cutting_board workspace)
        (is-workspace workspace)
    )
    (:goal (and
        (is-sliced cucumber)
        (not (is-whole cucumber))
        (at cucumber bowl)
        (at tomato1 bowl)
        (at tomato2 bowl)
    ))
)