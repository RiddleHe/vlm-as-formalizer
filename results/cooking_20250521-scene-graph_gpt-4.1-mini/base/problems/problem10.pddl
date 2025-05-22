(define (problem slice_and_place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife - tool
        carrot1 carrot2 tomato - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole carrot1)
        (is-whole carrot2)
        (is-whole tomato)
        (at carrot1 cutting_board)
        (at carrot2 cutting_board)
        (at tomato counter)
        (available carrot1)
        (available carrot2)
        (available tomato)
        (at bowl counter)
        (is-workspace cutting_board)
    )
    (:goal 
        (and 
            (is-sliced tomato) 
            (is-sliced carrot1) 
            (is-sliced carrot2)
            (at carrot1 bowl)
            (at carrot2 bowl)
            (at tomato bowl)
        )
    )
)