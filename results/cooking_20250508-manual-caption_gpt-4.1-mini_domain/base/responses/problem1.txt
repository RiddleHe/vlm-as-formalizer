(define (problem slice_cucumber)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber - vegetable
        knife - tool
        bowl - bowl
        counter cutting_board - location
    )
    (:init
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board counter)
        (free robot1)
        (holding robot2 knife)
        (at robot1 counter)
        (at robot2 counter)
        (not (sliced cucumber))
    )
    (:goal (and
        (sliced cucumber)
        (at cucumber bowl)
    ))
)