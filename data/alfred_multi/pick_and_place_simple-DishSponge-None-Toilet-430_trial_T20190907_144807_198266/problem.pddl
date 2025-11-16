(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DishSponge_1 - object
        BathtubBasin_1 - receptacle
        Toilet_1 - receptacle
        )
    (:init
        (inReceptacle DishSponge_1 BathtubBasin_1)
    )
    (:goal (and
        (inReceptacle DishSponge_1 Toilet_1)
    ))
)