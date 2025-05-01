(define (problem slice-and-place)
    (:domain cooking)
    (:objects
        robot1
        robot2
        carrot - vegetable
        tomato - vegetable
        knife - tool
        bowl1 - bowl
        table - location
    )
    (:init
        (holding robot1 knife)
        (holding_knife robot1)
        (at carrot table)
        (at tomato table)
        (at bowl1 table)
        (available carrot)
        (available tomato)
        (available knife)
    )
    (:goal (and
        (sliced carrot)
        (sliced tomato)
        (in carrot bowl1)
        (in tomato bowl1)
    ))
)