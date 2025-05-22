(define (problem cooking_slice_cucumber_carrot)
    (:domain cooking)
    (:objects
        robot1 - robot
        robot2 - robot
        knife - tool
        carrot - vegetable
        cucumber - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (is-whole cucumber)
        (at carrot counter)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board counter)
        (is-workspace cutting_board)
        (available carrot)
        (available cucumber)
    )
    (:goal (and
        (is-sliced carrot)
        (is-sliced cucumber)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)