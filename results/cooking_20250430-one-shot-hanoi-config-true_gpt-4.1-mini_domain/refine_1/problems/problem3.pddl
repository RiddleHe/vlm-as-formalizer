(define (problem slice_carrot)
(:domain cooking)
(:objects
    robot1
    robot2
    carrot - vegetable
    knife - tool
    bowl - object
    table - location
)
(:init
    (at carrot table)
    (at bowl table)
    (holding robot1 knife)
    (not (sliced carrot))
)
(:goal (and 
        (sliced carrot)
        (at carrot bowl)
))
)