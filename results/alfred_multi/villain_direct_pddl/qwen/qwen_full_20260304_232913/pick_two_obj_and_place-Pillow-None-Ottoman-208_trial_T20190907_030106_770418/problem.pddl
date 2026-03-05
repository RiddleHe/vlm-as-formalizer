(define (problem put_cushions_on_ottoman)
    (:domain put_task)
    (:objects
        robot - agent
        cushion1 cushion2 - object
        ottoman - receptacle
    )
    (:init
        (atLocation robot cushion1)
        (atLocation robot cushion2)
        (atLocation robot ottoman)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle cushion1 ottoman)
            (inReceptacle cushion2 ottoman)
        )
    )
)