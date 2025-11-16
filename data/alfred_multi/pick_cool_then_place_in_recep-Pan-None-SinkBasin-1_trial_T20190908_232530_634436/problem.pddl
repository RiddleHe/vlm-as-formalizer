(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pan_1 - object
        Fridge_1 - fridge
        SinkBasin_1 - sink
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Pan_1 CounterTop_1)
    )
    (:goal (and
        (isCool Pan_1)
        (inReceptacle Pan_1 SinkBasin_1)
    ))
)