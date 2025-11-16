(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SprayBottle_1 - object
        Cabinet_1 - receptacle
        Toilet_1 - receptacle
        )
    (:init
        (inReceptacle SprayBottle_1 Toilet_1)
    )
    (:goal (and
        (inReceptacle SprayBottle_1 Cabinet_1)
    ))
)