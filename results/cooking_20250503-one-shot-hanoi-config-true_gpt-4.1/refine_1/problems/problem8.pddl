(define (problem slice-cucumber-and-serve)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    tomato1 tomato2 - vegetable
    cucumber1 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board counter - location
)
(:init
    ; Robots
    (free robot1)
    (carry robot2 knife1)
    ; Tools
    (can-cut knife1)
    ; Vegetables state
    (is-whole tomato1)
    (is-whole tomato2)
    (is-whole cucumber1)
    (available tomato1)
    (available tomato2)
    (available cucumber1)
    ; Locations
    (at tomato1 cutting_board)
    (at tomato2 cutting_board)
    (at cucumber1 counter)
    (at bowl1 counter)
    (at knife1 cutting_board)
    (is-workspace cutting_board)
)
(:goal
    (and
        (is-sliced cucumber1)
        (at cucumber1 bowl1)
        (at tomato1 bowl1)
        (at tomato2 bowl1)
    )
)
)