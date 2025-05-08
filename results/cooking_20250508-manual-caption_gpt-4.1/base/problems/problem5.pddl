(define (problem cooking_slice_and_bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber tomato - vegetable
        bowl - object
        counter cutting_board bowl - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (available cucumber)
        (at cucumber counter)
        (is-whole tomato)
        (available tomato)
        (at tomato counter)
        (available bowl)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (at cucumber bowl)
        (is-sliced tomato)
        (at tomato bowl)
    ))
)