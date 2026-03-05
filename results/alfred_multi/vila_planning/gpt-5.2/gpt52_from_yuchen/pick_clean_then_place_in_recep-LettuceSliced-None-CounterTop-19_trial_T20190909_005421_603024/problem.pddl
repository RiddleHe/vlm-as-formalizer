(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Knife_1 - knife
        Lettuce_1 - object
        DiningTable_1 - receptacle
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Knife_1 CounterTop_1)
        (inReceptacle Lettuce_1 DiningTable_1)
    )
    (:goal (and
        (isSliced Lettuce_1)
        (isClean Lettuce_1)
        (inReceptacle Lettuce_1 CounterTop_1)
    ))
)