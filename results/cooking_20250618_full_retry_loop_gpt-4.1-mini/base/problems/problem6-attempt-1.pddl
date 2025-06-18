(define (problem slice_and_place_veggies)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula - tool
        cutting_board bowl counter - location
        cucumber carrot - vegetable
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole cucumber)
        (is-whole carrot)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (at cucumber counter)
        (at carrot counter)
        (at knife robot2)
        (is-workspace cutting_board)
        (available cucumber)
        (available carrot)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (at cucumber bowl)
        (at carrot bowl)
    ))
)