(define (problem cooking-slice-carrot-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot1 - vegetable
        cucumber1 cucumber2 - vegetable
        knife1 - tool
        cutting_board1 bowl1 counter1 - location
    )
    (:init
        ; Locations
        (at carrot1 counter1)
        (at cucumber1 cutting_board1)
        (at cucumber2 cutting_board1)
        (at knife1 cutting_board1)

        ; Availabilities
        (available carrot1)
        (available cucumber1)
        (available cucumber2)
        (available knife1)

        ; Vegetable states
        (is-whole carrot1)
        (is-whole cucumber1)
        (is-whole cucumber2)

        ; Knife is a cutting tool
        (can-cut knife1)

        ; Workspaces
        (is-workspace cutting_board1)

        ; Robots are free
        (free robot1)
        (free robot2)
    )
    (:goal
        (and
            (is-sliced carrot1)
            (at carrot1 bowl1)
            (at cucumber1 bowl1)
            (at cucumber2 bowl1)
        )
    )
)