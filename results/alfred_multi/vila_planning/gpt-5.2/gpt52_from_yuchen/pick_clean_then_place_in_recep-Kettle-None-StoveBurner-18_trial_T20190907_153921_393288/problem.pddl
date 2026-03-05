(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Kettle_1 - object
        SinkBasin_1 - sink
        StoveBurner_1 - receptacle
        )
    (:init
        (inReceptacle Kettle_1 StoveBurner_1)
    )
    (:goal (and
        (isClean Kettle_1)
        (inReceptacle Kettle_1 StoveBurner_1)
    ))
)