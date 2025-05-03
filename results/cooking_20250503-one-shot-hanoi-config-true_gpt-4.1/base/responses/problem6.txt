(define (problem cooking-slice-and-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber carrot - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; Robots: robot1 is free, robot2 is holding knife
        (free robot1)
        (carry robot2 knife)
        ; Knife is a cutting tool
        (can-cut knife)
        ; State of vegetables
        (is-whole cucumber)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        ; Initial locations
        (at cucumber counter)
        (at carrot counter)
        (at bowl counter)
        (at cutting_board counter)
        ; Workspaces
        (is-workspace cutting_board)
        ; Objects available for pick
        (available cucumber)
        (available carrot)
        (available bowl)
        ; Knife is not available (being held)
        ; (not (available knife)) ; Implicit by being carried
    )
    (:goal
        (and
            (is-sliced cucumber)
            (is-sliced carrot)
            (at cucumber bowl)
            (at carrot bowl)
        )
    )
)