(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot tomato - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available carrot)
        (available tomato)
        (available bowl)
        (is-whole tomato)
        (is-sliced carrot)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot cutting_board)
        (at tomato counter)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
            (at carrot bowl)
        )
    )
)