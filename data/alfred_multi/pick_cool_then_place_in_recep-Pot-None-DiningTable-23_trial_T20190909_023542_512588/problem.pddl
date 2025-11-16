(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pot_1 - object
        DiningTable_1 - receptacle
        StoveBurner_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Pot_1 StoveBurner_1)
    )
    (:goal (and
        (isCool Pot_1)
        (inReceptacle Pot_1 DiningTable_1)
    ))
)