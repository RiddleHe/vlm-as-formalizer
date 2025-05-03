(define (problem slice_cucumbers_carrot)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber1 cucumber2 - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        ; robot states
        (free robot1)
        (carry robot2 knife)
        
        ; tool
        (can-cut knife)
        (available carrot)
        (available cucumber1)
        (available cucumber2)

        ; ingredient states
        (is-whole carrot)
        (is-whole cucumber1)
        (is-whole cucumber2)

        ; locations
        (at carrot counter)
        (at bowl counter)
        (at knife cutting_board)
        (at cucumber1 cutting_board)
        (at cucumber2 cutting_board)
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (is-sliced cucumber1)
        (is-sliced cucumber2)
        (at carrot bowl)
        (at cucumber1 bowl)
        (at cucumber2 bowl)
    ))
)