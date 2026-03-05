(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        Knife_1 - knife
        GarbageCan_1 - receptacle
        Cabinet_1 - receptacle
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        CounterTop_2 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 CounterTop_2)
        (inReceptacle Knife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Tomato_1)
        (isHot Tomato_1)
        (inReceptacle Tomato_1 GarbageCan_1)
    ))
)