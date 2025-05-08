(define (problem cook_carrot_bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot - vegetable
        knife - tool
        bowl - object
        cutting_board counter - location
    )
    (:init
        (is-whole carrot)
        (available carrot)
        (at carrot counter)
        (available bowl)
        (at bowl counter)
        (can-cut knife)
        (carry robot2 knife)
        (not (free robot2))
        (free robot1)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
    ))
)