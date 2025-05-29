(define (problem cooking1)
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
        (is-whole cucumber)
        (available carrot)
        (available cucumber)
        (available bowl)
        (at carrot counter)
        (at cucumber cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (is-sliced cucumber)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)