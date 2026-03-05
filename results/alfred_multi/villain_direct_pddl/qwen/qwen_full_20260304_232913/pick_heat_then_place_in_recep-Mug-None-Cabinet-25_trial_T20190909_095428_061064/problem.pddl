(define (problem warm_mug_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        mug - object
        microwave - microwave
        cabinet - receptacle
        knife - knife
    )
    (:init
        (atLocation agent1 microwave)
        (inReceptacle mug microwave)
        (openable cabinet)
        (not (opened cabinet))
        (not (isHot mug))
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle mug cabinet)
            (isHot mug)
        )
    )
)