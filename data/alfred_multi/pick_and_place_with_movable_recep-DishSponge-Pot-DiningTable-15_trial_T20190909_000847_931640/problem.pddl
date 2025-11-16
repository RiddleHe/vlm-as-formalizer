(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DishSponge_1 - object
        Pot_1 - receptacle
        DiningTable_1 - receptacle
        Cabinet_1 - receptacle
        StoveBurner_1 - receptacle
        )
    (:init
        (inReceptacle DishSponge_1 Cabinet_1)
        (inReceptacle Pot_1 StoveBurner_1)
    )
    (:goal (and
        (inReceptacle DishSponge_1 Pot_1)
        (inReceptacle Pot_1 DiningTable_1)
    ))
)