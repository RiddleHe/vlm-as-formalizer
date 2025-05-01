(define (problem slice_and_place_veg)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        bowl - location
        cutting_board - location
        cucumber carrot - vegetable
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot1 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (at cucumber cutting_board)
        (at carrot cutting_board)
        (at bowl bowl)
        (is-workspace cutting_board)
        (available knife)
        (available cucumber)
        (available carrot)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (at cucumber bowl)
        (at carrot bowl)
    ))
)