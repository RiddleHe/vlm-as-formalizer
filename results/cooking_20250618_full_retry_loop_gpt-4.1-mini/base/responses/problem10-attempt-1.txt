(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        tomato1 tomato2 carrot1 - vegetable
        cutting_board bowl counter - location
    )
    (:init
        ; robots status
        (free robot1)
        (carry robot2 knife)
        ; tools
        (can-cut knife)
        ; locations are workspaces
        (is-workspace cutting_board)
        ; initial object states and locations
        (is-whole tomato1)
        (is-whole tomato2)
        (is-whole carrot1)
        (available tomato1)
        (available tomato2)
        (available carrot1)
        (at tomato1 counter)
        (at tomato2 counter)
        (at carrot1 counter)
        (at cutting_board cutting_board)
        (at bowl bowl)
        (at knife robot2) ; knife currently carried by robot2
    )
    (:goal (and
        (is-sliced tomato1)
        (is-sliced tomato2)
        (at tomato1 bowl)
        (at tomato2 bowl)
        (at carrot1 bowl)
    ))
)