(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Lettuce_1 - object
        Knife_1 - knife
        CounterTop_1 - receptacle
        CounterTop_2 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Knife_1 CounterTop_1)
        (inReceptacle Lettuce_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Lettuce_1)
        (isCool Lettuce_1)
        (inReceptacle Lettuce_1 CounterTop_1)
    ))
)