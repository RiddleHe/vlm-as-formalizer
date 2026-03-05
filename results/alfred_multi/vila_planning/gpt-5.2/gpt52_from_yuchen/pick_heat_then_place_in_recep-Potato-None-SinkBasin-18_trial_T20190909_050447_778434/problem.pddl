(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Potato_1 - object
        Microwave_1 - microwave
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Potato_1 SinkBasin_1)
    )
    (:goal (and
        (isHot Potato_1)
        (inReceptacle Potato_1 SinkBasin_1)
    ))
)