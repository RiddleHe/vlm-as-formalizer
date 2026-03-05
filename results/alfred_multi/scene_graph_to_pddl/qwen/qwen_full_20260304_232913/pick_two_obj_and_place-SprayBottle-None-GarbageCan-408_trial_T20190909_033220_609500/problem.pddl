(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        cabinet - receptacle
        toilet - receptacle
        rubber_duck - object
        countertop - object
        floor - object
    )
    (:init
        (openable cabinet)
        (openable toilet)
        (inReceptacle rubber_duck sink)
        (not (atLocation robot sink))
        (not (atLocation robot cabinet))
        (not (atLocation robot toilet))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle rubber_duck toilet)
        )
    )
)