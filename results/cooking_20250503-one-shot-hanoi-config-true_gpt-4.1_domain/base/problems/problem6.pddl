(define (problem cooking-slice-and-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber carrot - vegetable
        bowl1 - object
        knife1 - tool
        board1 - location
        counter - location
        tray1 - location
    )
    (:init
        (on-board board1)
        (at cucumber tray1)
        (at carrot tray1)
        (at bowl1 tray1)
        (at knife1 board1)
        (is-knife knife1)
        (is-bowl bowl1)
        (is-vegetable cucumber)
        (is-vegetable carrot)
        (handfree robot1)
        (holding robot2 knife1)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (in-bowl cucumber bowl1)
        (in-bowl carrot bowl1)
    ))
)