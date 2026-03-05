(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pot_1 - object
        SinkBasin_1 - sink
        StoveBurner_1 - receptacle
        StoveBurner_2 - receptacle
        )
    (:init
        (inReceptacle Pot_1 StoveBurner_1)
    )
    (:goal (and
        (isClean Pot_1)
        (inReceptacle Pot_1 StoveBurner_1)
    ))
)