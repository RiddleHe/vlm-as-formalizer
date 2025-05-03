(define (problem cooking-slice-and-bowl)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber carrot tomato - vegetable
    knife1 - tool
    bowl1 - bowl
    table - location
)
(:init
    (at cucumber table)
    (at carrot table)
    (at tomato table)
    (at bowl1 table)
    (at knife1 table)
    (knife knife1)
    (handempty robot1)
    (handempty robot2)
    (clear cucumber)
    (clear carrot)
    (clear tomato)
    (clear bowl1)
    (clear knife1)
)
(:goal (and
    (sliced cucumber)
    (sliced carrot)
    (sliced tomato)
    (in-bowl cucumber bowl1)
    (in-bowl carrot bowl1)
    (in-bowl tomato bowl1)
))
)