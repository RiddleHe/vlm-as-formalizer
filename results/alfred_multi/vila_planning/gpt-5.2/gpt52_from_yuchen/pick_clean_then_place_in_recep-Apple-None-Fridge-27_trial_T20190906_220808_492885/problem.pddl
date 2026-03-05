(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Apple_1 - object
        Fridge_1 - fridge
        Microwave_1 - microwave
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Apple_1 Microwave_1)
    )
    (:goal (and
        (isClean Apple_1)
        (inReceptacle Apple_1 Fridge_1)
    ))
)