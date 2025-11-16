(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Potato_1 - object
        DiningTable_1 - receptacle
        Microwave_1 - microwave
        SinkBasin_1 - sink
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Potato_1 DiningTable_1)
    )
    (:goal (and
        (isSliced Potato_1)
        (isClean Potato_1)
        (inReceptacle Potato_1 Microwave_1)
    ))
)