(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        spray_bottle1 spray_bottle2 - object
        garbage_bin - receptacle
        sink - sink
        cabinet - receptacle
    )
    (:init
        (openable garbage_bin)
        (atLocation robot sink) ; Assuming robot starts near the sink based on images
        (not (holdsAny robot))
        (not (inReceptacle spray_bottle1 garbage_bin))
        (not (inReceptacle spray_bottle2 garbage_bin))
    )
    (:goal
        (and
            (inReceptacle spray_bottle1 garbage_bin)
            (inReceptacle spray_bottle2 garbage_bin)
        )
    )
)