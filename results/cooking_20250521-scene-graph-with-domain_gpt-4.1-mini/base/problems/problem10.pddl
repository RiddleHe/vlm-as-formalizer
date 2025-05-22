(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cutting_board bowl counter - location
        tomato carrot1 carrot2 - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-workspace cutting_board)
        (at tomato counter)
        (at carrot1 cutting_board)
        (at carrot2 cutting_board)
        (is-whole tomato)
        (is-sliced carrot1)
        (is-sliced carrot2)
        (available tomato)
        (available carrot1)
        (available carrot2)
        (available bowl)
    )
    (:goal
        (and
            (is-sliced tomato)
            (at tomato bowl)
            (at carrot1 bowl)
            (at carrot2 bowl)
        )
    )
)