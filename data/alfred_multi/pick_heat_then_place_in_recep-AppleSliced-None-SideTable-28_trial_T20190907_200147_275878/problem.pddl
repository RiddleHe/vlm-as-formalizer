(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Apple_1 - object
        Knife_1 - knife
        DiningTable_1 - receptacle
        Microwave_1 - microwave
        SinkBasin_1 - sink
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Apple_1 DiningTable_1)
        (inReceptacle Knife_1 SinkBasin_1)
    )
    (:goal (and
        (isSliced Apple_1)
        (isHot Apple_1)
        (inReceptacle Apple_1 SideTable_1)
    ))
)