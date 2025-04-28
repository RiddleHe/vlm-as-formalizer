(define (problem cooking2)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber - vegetable
    tomato - vegetable
    knife - tool
    cutting_board - location
    bowl - location
)
(:init
    (at cucumber cutting_board)
    (at tomato cutting_board)
    (available knife)
    (at knife cutting_board)
)
(:goal (and
    (sliced cucumber)
    (at cucumber bowl)
    (at tomato bowl)
))
)