(define (problem cleanup_knife_mug)
    (:domain put_task)
    (:objects
        robot - agent
        knife - knife
        mug - object
        sink - sink
    )
    (:init
        (atLocation robot knife)
        (holds robot knife)
        (holdsAny robot)
        (atLocation robot mug)
        (holds robot mug)
        (holdsAny robot)
        (openable sink)
    )
    (:goal (and
        (inReceptacle knife sink)
        (inReceptacle mug sink)
        (isClean knife)
        (isClean mug)
    ))
)