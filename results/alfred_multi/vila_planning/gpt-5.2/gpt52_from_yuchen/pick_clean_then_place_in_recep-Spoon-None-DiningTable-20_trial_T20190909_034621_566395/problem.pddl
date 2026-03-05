(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Spoon_1 - object
        DiningTable_1 - receptacle
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Spoon_1 CounterTop_1)
    )
    (:goal (and
        (isClean Spoon_1)
        (inReceptacle Spoon_1 DiningTable_1)
    ))
)