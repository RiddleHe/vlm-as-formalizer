(define (problem cooking_slice_carrot_tomato)
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
        (available cutting_board)
        (is-whole carrot)
        (is-whole tomato)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at tomato counter)
        (at bowl counter)
        (at knife robot2)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (is-sliced tomato)
        (at carrot bowl)
        (at tomato bowl)
    ))
)