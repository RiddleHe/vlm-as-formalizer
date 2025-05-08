(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        tomato carrot - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; Locations
        (at bowl counter)
        (at tomato counter)
        (at cutting_board counter)
        (at carrot cutting_board)

        ; Workspace
        (is-workspace cutting_board)

        ; Vegetable states
        (is-whole tomato)
        (not (is-sliced tomato))
        (not (is-whole carrot))
        (is-sliced carrot)

        ; Robot states
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)

        ; Object availability
        (available bowl)
        (available tomato)
        (not (available knife))
        (available carrot)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
            (at carrot bowl)
        )
    )
)