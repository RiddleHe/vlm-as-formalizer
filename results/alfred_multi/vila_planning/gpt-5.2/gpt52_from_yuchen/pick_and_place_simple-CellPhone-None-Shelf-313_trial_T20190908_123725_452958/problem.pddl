(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CellPhone_1 - object
        Shelf_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle CellPhone_1 SideTable_1)
    )
    (:goal (and
        (inReceptacle CellPhone_1 Shelf_1)
    ))
)