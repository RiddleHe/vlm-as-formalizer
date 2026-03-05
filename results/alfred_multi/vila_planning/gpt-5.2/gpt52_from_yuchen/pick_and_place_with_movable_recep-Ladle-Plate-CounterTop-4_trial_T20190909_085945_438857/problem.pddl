(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Ladle_1 - object
        Plate_1 - receptacle
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Plate_1 SinkBasin_1)
        (inReceptacle Ladle_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle Ladle_1 Plate_1)
        (inReceptacle Plate_1 CounterTop_1)
    ))
)