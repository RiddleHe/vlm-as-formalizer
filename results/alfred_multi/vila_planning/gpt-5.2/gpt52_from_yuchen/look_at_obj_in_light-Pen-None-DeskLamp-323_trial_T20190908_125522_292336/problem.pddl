(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pen_1 - object
        DeskLamp_1 - object
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Pen_1 SideTable_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 Pen_1)
    ))
)