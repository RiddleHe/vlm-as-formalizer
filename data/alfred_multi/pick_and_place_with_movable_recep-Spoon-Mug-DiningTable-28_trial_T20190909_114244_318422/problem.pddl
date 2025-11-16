(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - receptacle
        Spoon_1 - object
        DiningTable_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 SideTable_1)
        (inReceptacle Spoon_1 SideTable_1)
    )
    (:goal (and
        (inReceptacle Spoon_1 Mug_1)
        (inReceptacle Mug_1 DiningTable_1)
    ))
)