(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        shelf - receptacle
        mug - object
        counter - object
    )
    (:init
        (atLocation robot counter)
        (inReceptacle mug microwave)
        (openable microwave)
        (not (opened microwave))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle mug shelf)
            (not (inReceptacle mug microwave))
        )
    )
)