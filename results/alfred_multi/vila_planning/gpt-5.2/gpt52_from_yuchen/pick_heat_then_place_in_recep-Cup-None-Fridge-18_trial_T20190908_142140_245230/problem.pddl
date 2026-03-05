(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cup_1 - object
        Microwave_1 - microwave
        Fridge_1 - fridge
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Cup_1 SinkBasin_1)
    )
    (:goal (and
        (isHot Cup_1)
        (inReceptacle Cup_1 Fridge_1)
    ))
)