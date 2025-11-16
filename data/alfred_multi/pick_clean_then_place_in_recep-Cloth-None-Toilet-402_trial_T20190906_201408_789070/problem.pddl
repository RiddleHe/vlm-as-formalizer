(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cloth_1 - object
        SinkBasin_1 - sink
        Toilet_1 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Cloth_1 CounterTop_1)
    )
    (:goal (and
        (isClean Cloth_1)
        (inReceptacle Cloth_1 Toilet_1)
    ))
)