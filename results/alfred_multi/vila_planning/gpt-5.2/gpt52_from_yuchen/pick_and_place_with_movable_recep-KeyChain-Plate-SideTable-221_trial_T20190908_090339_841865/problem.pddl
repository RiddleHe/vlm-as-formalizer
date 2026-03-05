(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Plate_1 - receptacle
        KeyChain_1 - object
        DiningTable_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle KeyChain_1 SideTable_1)
        (inReceptacle Plate_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle KeyChain_1 Plate_1)
        (inReceptacle Plate_1 SideTable_1)
    ))
)