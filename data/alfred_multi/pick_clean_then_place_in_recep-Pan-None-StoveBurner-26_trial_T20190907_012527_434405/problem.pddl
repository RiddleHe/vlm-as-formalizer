(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pan_1 - object
        StoveBurner_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Pan_1 StoveBurner_1)
    )
    (:goal (and
        (isClean Pan_1)
        (inReceptacle Pan_1 StoveBurner_1)
    ))
)