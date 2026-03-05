(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pencil_2 - object
        Pencil_1 - object
        Shelf_1 - receptacle
        Shelf_2 - receptacle
        Desk_1 - receptacle
        )
    (:init
        (inReceptacle Pencil_2 Shelf_2)
        (inReceptacle Pencil_1 Shelf_1)
    )
    (:goal (and
        (inReceptacle Pencil_1 Desk_1)
        (inReceptacle Pencil_1 Desk_1)
    ))
)