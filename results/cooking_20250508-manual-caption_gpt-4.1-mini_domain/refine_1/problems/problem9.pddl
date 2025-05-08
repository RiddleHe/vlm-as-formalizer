(define (problem cooking_task)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    carrot cucumber - vegetable
    knife - tool
    cutting_board counter - location
    bowl1 - bowl
)
(:init
    (bowl bowl1)
    (cutting_board_loc cutting_board)
    (at carrot counter)
    (at cucumber cutting_board)
    (at bowl1 counter)
    (at robot1 counter)
    (at robot2 counter)
    (holding robot2 knife)
    (free robot1)
    (on_cutting_board cucumber cutting_board)
    (not (sliced carrot))
    (not (sliced cucumber))
)
(:goal (and
    (sliced carrot)
    (at carrot bowl1)
    (at cucumber bowl1)
))
)