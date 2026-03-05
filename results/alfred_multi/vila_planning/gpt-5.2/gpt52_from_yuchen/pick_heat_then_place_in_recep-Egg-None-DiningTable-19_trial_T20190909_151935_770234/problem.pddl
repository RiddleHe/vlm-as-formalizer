(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Egg_1 - object
        Microwave_1 - microwave
        SinkBasin_1 - sink
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Egg_1 SinkBasin_1)
    )
    (:goal (and
        (isHot Egg_1)
        (inReceptacle Egg_1 DiningTable_1)
    ))
)