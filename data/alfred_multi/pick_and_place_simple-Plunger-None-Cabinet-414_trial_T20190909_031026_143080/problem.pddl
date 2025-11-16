(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Plunger_1 - object
        Cabinet_1 - receptacle
        )
    (:init
    )
    (:goal (and
        (inReceptacle Plunger_1 Cabinet_1)
    ))
)