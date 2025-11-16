(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Apple_1 - object
        Fridge_1 - fridge
        CounterTop_1 - receptacle
        GarbageCan_1 - receptacle
        )
    (:init
        (inReceptacle Apple_1 CounterTop_1)
    )
    (:goal (and
        (isCool Apple_1)
        (inReceptacle Apple_1 GarbageCan_1)
    ))
)