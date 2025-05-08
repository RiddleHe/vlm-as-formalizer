(define (problem cook-salad)
    (:domain cooking)
    (:objects
        bowl counter cutting_board - location
        carrot cucumber - vegetable
        knife - tool
        r1 r2 - robot
    )
    (:init
        ; veggie states
        (is-whole carrot)
        (not (is-sliced carrot))
        (is-sliced cucumber)
        (not (is-whole cucumber))
        
        ; object locations
        (at bowl counter)
        (at carrot counter)
        (at cucumber cutting_board)
        (at knife r2)
        (at cutting_board counter)
        
        ; availability
        (available carrot)
        (available cucumber)
        
        ; robot states
        (free r1)
        (not (free r2))
        (carry r2 knife)
        
        ; tool properties
        (can-cut knife)
        
        ; workspace labeling
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)