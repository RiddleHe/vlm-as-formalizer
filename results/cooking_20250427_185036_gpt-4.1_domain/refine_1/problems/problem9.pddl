(define (problem cooking-slice-and-place)
(:domain cooking)
(:objects
    robot1 - robot
    carrot1 - vegetable
    cucumber1 cucumber2 - vegetable
    knife1 - tool
    bowl1 - object
    cutting_board tray - location
)
(:init
    (at carrot1 tray)
    (at cucumber1 cutting_board)
    (at cucumber2 cutting_board)
    (at knife1 cutting_board)
    (at bowl1 tray)
    (is-bowl bowl1)
    (is-knife knife1)
    (clear carrot1)
    (clear cucumber1)
    (clear cucumber2)
    (clear knife1)
    (clear bowl1)
)
(:goal 
    (and
        (sliced carrot1)
        (in-bowl carrot1)
        (in-bowl cucumber1)
        (in-bowl cucumber2)
    )
)
)