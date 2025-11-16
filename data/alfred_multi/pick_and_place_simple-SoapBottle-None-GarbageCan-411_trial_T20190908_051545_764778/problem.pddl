(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SoapBottle_1 - object
        GarbageCan_1 - receptacle
        Toilet_1 - receptacle
        )
    (:init
        (inReceptacle SoapBottle_1 Toilet_1)
    )
    (:goal (and
        (inReceptacle SoapBottle_1 GarbageCan_1)
    ))
)