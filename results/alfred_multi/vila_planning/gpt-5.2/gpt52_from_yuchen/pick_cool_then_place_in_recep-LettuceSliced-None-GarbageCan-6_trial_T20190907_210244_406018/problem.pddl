(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Lettuce_1 - object
        ButterKnife_1 - knife
        GarbageCan_1 - receptacle
        Fridge_1 - fridge
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Lettuce_1 CounterTop_2)
    )
    (:goal (and
        (isSliced Lettuce_1)
        (isCool Lettuce_1)
        (inReceptacle Lettuce_1 GarbageCan_1)
    ))
)