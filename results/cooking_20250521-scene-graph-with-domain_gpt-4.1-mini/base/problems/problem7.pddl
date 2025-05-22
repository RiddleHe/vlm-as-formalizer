(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        cutting_board bowl counter - location
        cucumber carrot tomato - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-workspace cutting_board)
        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)
        (at cucumber cutting_board)
        (at carrot cutting_board)
        (at tomato cutting_board)
        (available cucumber)
        (available carrot)
        (available tomato)
        (at bowl counter)
        (available bowl)
    )
    (:goal 
        (and
            (is-sliced cucumber)
            (is-sliced carrot)
            (is-sliced tomato)
            (at cucumber bowl)
            (at carrot bowl)
            (at tomato bowl)
        )
    )
)