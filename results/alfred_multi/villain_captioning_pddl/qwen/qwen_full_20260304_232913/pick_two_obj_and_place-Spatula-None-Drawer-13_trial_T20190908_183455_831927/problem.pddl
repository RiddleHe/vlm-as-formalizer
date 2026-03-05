(define (problem place_spatulas_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        spatula1 spatula2 - object
        drawer1 - receptacle
        countertop - object
    )
    (:init
        (atLocation robot countertop) ; Robot starts at the countertop to interact with objects
        (not (holdsAny robot))
        (not (opened drawer1))
        (openable drawer1)
        (not (inReceptacle spatula1 drawer1))
        (not (inReceptacle spatula2 drawer1))
        ; Spatulas are on the countertop (treated as location, not receptacle)
        (atLocation robot spatula1)
        (atLocation robot spatula2)
    )
    (:goal (and
        (inReceptacle spatula1 drawer1)
        (inReceptacle spatula2 drawer1)
    ))
)