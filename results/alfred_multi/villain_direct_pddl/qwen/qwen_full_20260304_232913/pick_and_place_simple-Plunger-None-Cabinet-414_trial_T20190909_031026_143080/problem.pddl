(define (problem place_plunger_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        plunger - object
        toilet - object
        cabinet - receptacle
        sink - receptacle
    )
    (:init
        (atLocation robot toilet)
        (inReceptacle plunger toilet)
        (openable cabinet)
        (not (opened cabinet))
    )
    (:goal
        (and
            (inReceptacle plunger cabinet)
            (atLocation robot cabinet)
        )
    )
)