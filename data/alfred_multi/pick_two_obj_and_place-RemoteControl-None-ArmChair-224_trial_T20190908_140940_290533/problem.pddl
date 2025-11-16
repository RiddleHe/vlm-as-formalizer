(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        RemoteControl_2 - object
        RemoteControl_1 - object
        SideTable_1 - receptacle
        Sofa_1 - receptacle
        ArmChair_1 - receptacle
        )
    (:init
        (inReceptacle RemoteControl_2 SideTable_1)
        (inReceptacle RemoteControl_1 Sofa_1)
    )
    (:goal (and
        (inReceptacle RemoteControl_1 ArmChair_1)
        (inReceptacle RemoteControl_1 ArmChair_1)
    ))
)