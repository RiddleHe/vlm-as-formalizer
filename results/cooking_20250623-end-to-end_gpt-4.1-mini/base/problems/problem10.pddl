(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        tomato carrot - vegetable
        workspace cutting_board bowl - location
    )
    (:init
        ; Robots
        (free robot1)
        (carry robot2 knife)
        ; Tools
        (can-cut knife)
        ; Vegetables
        (is-whole tomato)
        (at tomato workspace)
        (available tomato)
        (is-sliced carrot)
        (at carrot cutting_board)
        (available carrot)
        ; Locations
        (is-workspace workspace)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
            (is-sliced carrot)
            (at carrot bowl)
        )
    )
)