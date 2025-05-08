(define (problem slice-and-place-vegetables)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber carrot tomato - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)

        (available cucumber)
        (available carrot)
        (available tomato)

        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (not (is-sliced tomato))

        (at cucumber counter)
        (at carrot counter)
        (at tomato counter)
        (at bowl counter)

        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced cucumber)
        (is-sliced carrot)
        (is-sliced tomato)

        (at cucumber bowl)
        (at carrot bowl)
        (at tomato bowl)
    ))
)