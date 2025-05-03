(define (problem cooking-slice-and-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber carrot tomato - vegetable
        cutting_board bowl counter - location
    )
    (:init
        ; Locations and workspace
        (is-workspace cutting_board)
        (at knife cutting_board)
        (at cucumber counter)
        (at carrot counter)
        (at tomato counter)
        (at bowl counter)

        ; Object conditions
        (available cucumber)
        (available carrot)
        (available tomato)
        (available bowl)
        (can-cut knife)

        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)

        ; Robot states
        (carry robot2 knife)
        (free robot1)
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