(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cup_1 - receptacle
        ButterKnife_1 - knife
        CounterTop_1 - receptacle
        CounterTop_2 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Cup_1 Cabinet_1)
    )
    (:goal (and
        (inReceptacle ButterKnife_1 Cup_1)
        (inReceptacle Cup_1 CounterTop_1)
    ))
)