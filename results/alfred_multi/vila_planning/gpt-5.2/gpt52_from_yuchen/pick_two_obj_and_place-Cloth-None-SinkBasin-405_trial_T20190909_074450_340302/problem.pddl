(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cloth_2 - object
        Cloth_1 - object
        BathtubBasin_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Cloth_1 BathtubBasin_1)
        (inReceptacle Cloth_2 BathtubBasin_1)
    )
    (:goal (and
        (inReceptacle Cloth_1 SinkBasin_1)
        (inReceptacle Cloth_1 SinkBasin_1)
    ))
)