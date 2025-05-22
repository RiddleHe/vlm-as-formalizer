(define (problem slice_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (is-sliced cucumber)
        (at cucumber cutting_board)
        (at carrot counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)