(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Vase_1 - object
        Box_1 - receptacle
        Shelf_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Box_1 Shelf_1)
        (inReceptacle Vase_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle Vase_1 Box_1)
        (inReceptacle Box_1 DiningTable_1)
    ))
)