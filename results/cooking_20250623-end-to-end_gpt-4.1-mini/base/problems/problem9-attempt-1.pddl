(define (problem slice-and-place-carrot-and-cucumber)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber - vegetable
        knife - tool
        cutting_board workspace - location
        bowl - location
    )
    (:init
        ; robot states
        (free robot1)
        (carry robot2 knife)

        ; tool properties
        (can-cut knife)

        ; vegetable initial states
        (is-whole carrot)
        (not (is-sliced carrot))
        (is-whole cucumber)
        (not (is-sliced cucumber))

        ; locations
        (is-workspace cutting_board)

        (at carrot cutting_board)
        (at cucumber cutting_board)
        (at bowl workspace)

        (available carrot)
        (available cucumber)
        (available bowl)
    )
    (:goal (and
        (is-sliced carrot)
        (not (is-whole carrot))
        (at carrot bowl)
        (at cucumber bowl)
    ))
)