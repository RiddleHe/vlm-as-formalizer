(define (problem cooking2)
(:domain cooking)
(:objects
    robot1
    robot2
    bowl
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    counter
    cutting_board
)
(:init
    (at bowl counter)
    (at cucumber counter)
    (at tomato counter)
    (at cutting_board counter)
    (free robot1)
    (holding robot2 knife)
    (at robot1 counter)
    (at robot2 counter)
    (not (on_cutting_board cucumber))
    (not (on_cutting_board tomato))
    (on-cutting-board-location cutting_board)
)
(:goal (and
    (sliced cucumber)
    (sliced tomato)
    (at cucumber bowl)
    (at tomato bowl)
))
)