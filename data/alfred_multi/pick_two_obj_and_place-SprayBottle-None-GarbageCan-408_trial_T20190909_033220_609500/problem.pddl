(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SprayBottle_1 - object
        SprayBottle_2 - object
        GarbageCan_1 - receptacle
        Cabinet_2 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle SprayBottle_2 Cabinet_2)
        (inReceptacle SprayBottle_1 Cabinet_1)
    )
    (:goal (and
        (inReceptacle SprayBottle_1 GarbageCan_1)
        (inReceptacle SprayBottle_1 GarbageCan_1)
    ))
)