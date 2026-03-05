(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CellPhone_1 - object
        FloorLamp_1 - object
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle CellPhone_1 SideTable_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 CellPhone_1)
    ))
)