(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber knife - object
        carrot - vegetable
        cucumber - vegetable
        knife - tool
        counter cutting_board - location
        bowl1 - object
    )
    (:init
        (bowl bowl1)
        (cutting_board cutting_board)
        (at carrot counter)
        (at cucumber cutting_board)
        (at bowl1 counter)
        (at robot1 counter)
        (at robot2 counter)
        (holding robot2 knife)
        (free robot1)
        (on_cutting_board cucumber)
        (sliced cucumber)
        (not (sliced carrot))
    )
    (:goal (and
        (sliced carrot)
        (at carrot bowl1)
        (at cucumber bowl1)
    ))
)