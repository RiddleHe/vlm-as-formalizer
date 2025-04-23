(define (problem cucumber-slice-and-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board1 - location
    bowl_loc - location
    counter - location
)
(:init
    ; Locations
    (is-workspace cutting_board1)
    (at cucumber1 counter)
    (at bowl1 bowl_loc)
    (at knife1 cutting_board1)

    ; Object states
    (is-whole cucumber1)
    (available cucumber1)
    (available knife1)
    (can-cut knife1)

    ; Robot states
    (free robot1)
    (free robot2)
)
(:goal (and
    (is-sliced cucumber1)
    (at cucumber1 bowl_loc)
))
)