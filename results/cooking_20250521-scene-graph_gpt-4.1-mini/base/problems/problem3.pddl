(define (problem slice_and_place_carrot)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        carrot - vegetable
        cutting_board - location
        bowl - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (available carrot)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board cutting_board_position)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced carrot)
            (at carrot bowl)
        )
    )
)