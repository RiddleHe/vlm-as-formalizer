(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SaltShaker_2 - object
        SaltShaker_1 - object
        CounterTop_1 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle SaltShaker_1 CounterTop_1)
        (inReceptacle SaltShaker_2 CounterTop_1)
    )
    (:goal (and
        (inReceptacle SaltShaker_1 Cabinet_1)
        (inReceptacle SaltShaker_1 Cabinet_1)
    ))
)