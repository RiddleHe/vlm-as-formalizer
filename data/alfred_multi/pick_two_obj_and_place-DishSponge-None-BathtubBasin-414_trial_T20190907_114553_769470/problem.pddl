(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DishSponge_2 - object
        DishSponge_1 - object
        GarbageCan_1 - receptacle
        BathtubBasin_1 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle DishSponge_2 GarbageCan_1)
        (inReceptacle DishSponge_1 Cabinet_1)
    )
    (:goal (and
        (inReceptacle DishSponge_1 BathtubBasin_1)
        (inReceptacle DishSponge_1 BathtubBasin_1)
    ))
)