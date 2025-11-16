(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Potato_1 - object
        Knife_1 - knife
        SideTable_1 - receptacle
        DiningTable_1 - receptacle
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Potato_1 SideTable_1)
        (inReceptacle Knife_1 SideTable_1)
    )
    (:goal (and
        (isSliced Potato_1)
        (isHot Potato_1)
        (inReceptacle Potato_1 SideTable_1)
    ))
)