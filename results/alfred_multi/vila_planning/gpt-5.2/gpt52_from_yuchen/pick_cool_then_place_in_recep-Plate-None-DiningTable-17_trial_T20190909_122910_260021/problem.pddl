(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Plate_1 - object
        DiningTable_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Plate_1 DiningTable_1)
    )
    (:goal (and
        (isCool Plate_1)
        (inReceptacle Plate_1 DiningTable_1)
    ))
)