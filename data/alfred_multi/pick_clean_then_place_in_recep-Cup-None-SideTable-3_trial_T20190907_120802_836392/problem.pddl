(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cup_1 - object
        SinkBasin_1 - sink
        SideTable_1 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Cup_1 CounterTop_1)
    )
    (:goal (and
        (isClean Cup_1)
        (inReceptacle Cup_1 SideTable_1)
    ))
)