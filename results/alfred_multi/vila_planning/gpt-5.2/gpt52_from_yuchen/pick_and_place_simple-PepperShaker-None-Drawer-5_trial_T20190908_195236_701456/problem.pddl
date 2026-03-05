(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        PepperShaker_1 - object
        CounterTop_1 - receptacle
        Drawer_1 - receptacle
        )
    (:init
        (inReceptacle PepperShaker_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle PepperShaker_1 Drawer_1)
    ))
)