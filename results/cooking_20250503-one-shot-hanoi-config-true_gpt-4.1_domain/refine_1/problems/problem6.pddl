(define (problem cooking-slice-and-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber carrot - vegetable
    sliced-cucumber sliced-carrot - sliced-vegetable
    bowl1 - bowl
    knife1 - tool
    board1 - location
    tray1 - location
)
(:init
    (at cucumber tray1)
    (at carrot tray1)
    (at bowl1 tray1)
    (at knife1 board1)
    (on-board board1)
    (is-knife knife1)
    (handfree robot1)
    (holding robot2 knife1)
)
(:goal (and
    (is-sliced cucumber)
    (is-sliced carrot)
    (exists-sliced sliced-cucumber)
    (exists-sliced sliced-carrot)
    (in-bowl sliced-cucumber bowl1)
    (in-bowl sliced-carrot bowl1)
))
)