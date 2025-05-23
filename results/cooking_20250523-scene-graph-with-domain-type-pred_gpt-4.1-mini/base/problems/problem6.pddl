(define (problem slice_vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber - vegetable
        knife - tool
        cutting_board bowl counter - location
    )
    (:init
        (available carrot)
        (available cucumber)
        (available bowl)
        (available cutting_board)
        (is-whole carrot)
        (is-whole cucumber)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (at carrot counter)
        (at cucumber counter)
        (at cutting_board cutting_board)
        (at bowl bowl)
        (is-workspace cutting_board)
    )
    (:goal (and 
        (is-sliced carrot)
        (is-sliced cucumber)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)