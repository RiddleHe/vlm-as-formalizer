(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        tomato - vegetable
        knife - tool
        bowl1 - bowl
        counter
        cuttingboard_location - location
    )
    (:init
        (at tomato counter)
        (at bowl1 counter)
        (cutting_board cuttingboard_location)
        (free robot1)
        (holding robot2 knife)
    )
    (:goal (and
        (sliced tomato)
        (at tomato bowl1)
    ))
)