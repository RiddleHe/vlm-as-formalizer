(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Tomato_1 - object
        SinkBasin_1 - sink
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 SinkBasin_1)
        (inReceptacle ButterKnife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Tomato_1)
        (isHot Tomato_1)
        (inReceptacle Tomato_1 SinkBasin_1)
    ))
)