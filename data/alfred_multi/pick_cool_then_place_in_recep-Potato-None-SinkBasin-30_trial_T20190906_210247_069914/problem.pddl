(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Potato_1 - object
        GarbageCan_1 - receptacle
        Fridge_1 - fridge
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Potato_1 GarbageCan_1)
    )
    (:goal (and
        (isCool Potato_1)
        (inReceptacle Potato_1 SinkBasin_1)
    ))
)