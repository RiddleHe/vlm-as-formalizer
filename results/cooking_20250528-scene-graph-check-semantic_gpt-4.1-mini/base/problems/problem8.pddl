(define (problem cooking_task_2)
    (:domain cooking)
    (:objects
        cutting_board bowl counter - location
        cucumber tomato - vegetable
        knife cleaver - tool
        robot1 robot2 - robot
    )
    (:init
        (available cucumber)
        (available tomato)
        (available bowl)
        (available cutting_board)
        (available cleaver)
        (available knife)
        (is-whole cucumber)
        (is-whole tomato)
        (free robot1)
        (carry robot2 cleaver)
        (can-cut cleaver)
        (can-cut knife)
        (at cucumber counter)
        (at tomato cutting_board)
        (at bowl counter)
        (at cutting_board cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (at cucumber bowl)
        (at tomato bowl)
    ))
)