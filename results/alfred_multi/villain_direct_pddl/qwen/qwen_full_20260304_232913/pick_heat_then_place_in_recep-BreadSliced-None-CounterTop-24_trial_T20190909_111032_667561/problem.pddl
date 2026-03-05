(define (problem put_warm_slice_bread)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        knife1 - knife
        bread1 - object
        counter1 - receptacle
    )
    (:init
        (openable microwave1)
        (atLocation agent1 counter1)
        (inReceptacle bread1 counter1)
        (inReceptacle knife1 counter1)
        (not (isHot bread1))
        (not (isSliced bread1))
        (not (isClean knife1))
    )
    (:goal
        (and
            (inReceptacle bread1 counter1)
            (isHot bread1)
            (isSliced bread1)
        )
    )
)