(define (problem slice_and_bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber tomato - vegetable
    knife - tool
    bowl1 - bowl
    chopping_board table - location
)
(:init
    (handfree robot1)
    (holding robot2 knife)
    (at cucumber chopping_board)
    (at tomato chopping_board)
    (at knife table)
    (at bowl1 table)
    (on-chopping-board cucumber)
    (on-chopping-board tomato)
)
(:goal (and
    (sliced cucumber)
    (sliced tomato)
    (in-bowl cucumber bowl1)
    (in-bowl tomato bowl1)
))
)