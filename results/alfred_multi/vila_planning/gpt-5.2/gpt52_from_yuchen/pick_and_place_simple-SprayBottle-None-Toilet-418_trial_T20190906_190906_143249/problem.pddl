(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SprayBottle_1 - object
        Toilet_1 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle SprayBottle_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle SprayBottle_1 Toilet_1)
    ))
)