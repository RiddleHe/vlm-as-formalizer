(define (problem slice_cucumber_and_place_veggies)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        cucumber tomato - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (is-sliced tomato)
        (at cucumber counter)
        (at tomato cutting_board)
        (at bowl counter)
        (is-workspace cutting_board)
        (available bowl)
        (available cucumber)
        (available tomato)
    )
    (:goal (and
        (is-sliced cucumber)
        (not (is-whole cucumber))
        (at cucumber bowl)
        (at tomato bowl)
    ))
)