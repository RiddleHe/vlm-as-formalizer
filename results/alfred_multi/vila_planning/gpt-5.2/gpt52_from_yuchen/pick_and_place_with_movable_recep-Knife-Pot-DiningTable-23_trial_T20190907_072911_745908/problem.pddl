(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pot_1 - receptacle
        Knife_1 - knife
        StoveBurner_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Pot_1 StoveBurner_1)
        (inReceptacle Knife_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle Knife_1 Pot_1)
        (inReceptacle Pot_1 DiningTable_1)
    ))
)