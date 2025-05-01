(define (problem slice-carrot-place-in-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula - tool
        carrot cucumber - vegetable
        bowl cuttingboard counter - location
    )
    (:init
        (free robot1)
        (free robot2)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot)
        (is-whole cucumber)
        (not (is-sliced carrot))
        (not (is-sliced cucumber))
        (available carrot)
        (available cucumber)
        (available knife)
        (at carrot counter)
        (at cucumber cuttingboard)
        (at bowl counter)
        (is-workspace counter)
        (is-workspace cuttingboard)
    )
    (:goal
        (and
            (is-sliced carrot)
            (not (is-whole carrot))
            (at carrot bowl)
            (at cucumber bowl)
        )
    )
)