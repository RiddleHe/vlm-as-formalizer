(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Egg_1 - object
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        GarbageCan_1 - receptacle
        )
    (:init
        (inReceptacle Egg_1 CounterTop_1)
    )
    (:goal (and
        (isHot Egg_1)
        (inReceptacle Egg_1 GarbageCan_1)
    ))
)