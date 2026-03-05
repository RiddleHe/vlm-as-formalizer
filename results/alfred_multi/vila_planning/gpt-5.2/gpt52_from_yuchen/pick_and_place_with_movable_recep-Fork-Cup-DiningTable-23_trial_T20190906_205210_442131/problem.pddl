(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Fork_1 - object
        Cup_1 - receptacle
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Fork_1 CounterTop_1)
        (inReceptacle Cup_1 SinkBasin_1)
    )
    (:goal (and
        (inReceptacle Fork_1 Cup_1)
        (inReceptacle Cup_1 DiningTable_1)
    ))
)