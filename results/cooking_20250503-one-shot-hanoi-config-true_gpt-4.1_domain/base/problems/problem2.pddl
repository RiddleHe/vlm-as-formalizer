(define (problem cooking-tomato-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        tomato - vegetable
        knife1 - tool
        bowl cutting_board counter - location
    )
    (:init
        (at tomato counter)
        (at knife1 cutting_board)
        (handfree robot1)
        (holding robot2 knife1)
        (knife knife1)
        (empty bowl)
        (empty cutting_board)
        (empty counter)
    )
    (:goal (and
        (sliced tomato)
        (at tomato bowl)
    ))
)