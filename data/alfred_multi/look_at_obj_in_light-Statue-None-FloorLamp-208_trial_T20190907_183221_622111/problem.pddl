(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        FloorLamp_1 - object
        Statue_1 - object
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Statue_1 SideTable_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 Statue_1)
    ))
)