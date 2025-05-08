(define (problem cooking_slice_and_place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber tomato - vegetable
        knife spatula spoon - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (is-sliced tomato)
        (not (is-whole tomato))
        (available cucumber)
        (available tomato)
        (at cucumber counter)
        (at tomato cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (is-workspace counter)
    )
    (:goal (and
        (is-sliced cucumber)
        (not (is-whole cucumber))
        (at cucumber bowl)
        (at tomato bowl)
    ))
)