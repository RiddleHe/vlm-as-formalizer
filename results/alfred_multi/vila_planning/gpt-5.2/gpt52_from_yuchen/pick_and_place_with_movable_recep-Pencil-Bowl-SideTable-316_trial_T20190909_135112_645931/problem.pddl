(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - receptacle
        Pencil_1 - object
        Desk_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Pencil_1 Desk_1)
        (inReceptacle Bowl_1 Desk_1)
    )
    (:goal (and
        (inReceptacle Pencil_1 Bowl_1)
        (inReceptacle Bowl_1 SideTable_1)
    ))
)