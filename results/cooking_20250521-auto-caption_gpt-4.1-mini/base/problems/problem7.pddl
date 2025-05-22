(define (problem slice_vegetables_and_place_in_bowl)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        cutting_board bowl - location
        cucumber carrot tomato - vegetable
    )
    (:init
        ; Locations of vegetables and bowl
        (at cucumber cutting_board)
        (at carrot cutting_board)
        (at tomato cutting_board)
        (at bowl bowl) ; bowl placed at its own location
        
        ; Workspace and tools
        (is-workspace cutting_board)
        (can-cut knife)
        
        ; Robot states
        (free robot1)
        (carry robot2 knife)
        
        ; Vegetable states (all whole, none sliced)
        (is-whole cucumber)
        (is-whole carrot)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced carrot))
        (not (is-sliced tomato))
        
        ; Objects are initially available if not carried
        (available cucumber)
        (available carrot)
        (available tomato)
        (available bowl)
        (not (available knife))
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