(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Knife_1 - knife
        SideTable_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Knife_1 SideTable_1)
    )
    (:goal (and
        (isClean Knife_1)
        (inReceptacle Knife_1 SideTable_1)
    ))
)