(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        Mug_2 - object
        Desk_1 - receptacle
        Shelf_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 SideTable_1)
        (inReceptacle Mug_2 Shelf_1)
    )
    (:goal (and
        (inReceptacle Mug_1 Desk_1)
        (inReceptacle Mug_1 Desk_1)
    ))
)