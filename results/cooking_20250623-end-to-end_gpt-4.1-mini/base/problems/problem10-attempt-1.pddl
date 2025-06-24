(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        tomato carrot - vegetable
        workspace - location
        cutting_board - location
        bowl - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole tomato)
        (not (is-sliced tomato))
        (is-whole carrot)
        (not (is-sliced carrot))
        (at tomato workspace)
        (at carrot workspace)
        (at knife robot2)
        (is-workspace workspace)
        (at cutting_board workspace)
        (at bowl workspace)
        (available tomato)
        (available carrot)
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