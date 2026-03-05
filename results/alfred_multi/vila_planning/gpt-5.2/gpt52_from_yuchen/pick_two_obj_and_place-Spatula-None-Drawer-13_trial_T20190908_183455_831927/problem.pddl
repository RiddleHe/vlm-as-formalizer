(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Spatula_1 - object
        Spatula_2 - object
        CounterTop_1 - receptacle
        Drawer_1 - receptacle
        )
    (:init
        (inReceptacle Spatula_2 CounterTop_1)
        (inReceptacle Spatula_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle Spatula_1 Drawer_1)
        (inReceptacle Spatula_1 Drawer_1)
    ))
)