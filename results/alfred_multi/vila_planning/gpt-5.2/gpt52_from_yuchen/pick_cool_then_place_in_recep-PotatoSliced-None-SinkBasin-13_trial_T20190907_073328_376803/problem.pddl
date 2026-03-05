(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Knife_1 - knife
        Potato_1 - object
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Potato_1 SinkBasin_1)
        (inReceptacle Knife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Potato_1)
        (isCool Potato_1)
        (inReceptacle Potato_1 SinkBasin_1)
    ))
)