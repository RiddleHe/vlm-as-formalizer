(define (problem cooking-carrot-saladslice)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    carrot1 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board1 - object
    counter1 - location
    bowl_loc - location
    cutting_board_loc - location
)

(:init
    ; Locations are workspaces if appropriate
    (is-workspace cutting_board_loc)
    ; Place objects at their initial locations
    (at carrot1 counter1)
    (at bowl1 bowl_loc)
    (at knife1 counter1)
    (at cutting_board1 cutting_board_loc)
    ; Initial object states
    (available carrot1)
    (available knife1)
    (is-whole carrot1)
    (not (is-sliced carrot1))
    (can-cut knife1)
    ; Robots are free
    (free robot1)
    (free robot2)
)

(:goal (and
    (is-sliced carrot1)
    (at carrot1 bowl_loc)
))
)