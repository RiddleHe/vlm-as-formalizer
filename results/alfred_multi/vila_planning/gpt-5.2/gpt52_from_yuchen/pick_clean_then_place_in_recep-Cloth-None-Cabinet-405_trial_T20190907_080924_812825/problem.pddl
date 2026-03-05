(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cloth_1 - object
        CounterTop_1 - receptacle
        Cabinet_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Cloth_1 CounterTop_1)
    )
    (:goal (and
        (isClean Cloth_1)
        (inReceptacle Cloth_1 Cabinet_1)
    ))
)