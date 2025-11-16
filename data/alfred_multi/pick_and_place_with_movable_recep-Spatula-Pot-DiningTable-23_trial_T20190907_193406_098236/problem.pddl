(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pot_1 - receptacle
        Spatula_1 - object
        DiningTable_1 - receptacle
        StoveBurner_1 - receptacle
        )
    (:init
        (inReceptacle Spatula_1 DiningTable_1)
        (inReceptacle Pot_1 StoveBurner_1)
    )
    (:goal (and
        (inReceptacle Spatula_1 Pot_1)
        (inReceptacle Pot_1 DiningTable_1)
    ))
)