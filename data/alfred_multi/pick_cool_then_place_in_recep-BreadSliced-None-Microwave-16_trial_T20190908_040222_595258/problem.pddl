(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bread_1 - object
        Knife_1 - knife
        CounterTop_1 - receptacle
        CounterTop_2 - receptacle
        Microwave_1 - microwave
        DiningTable_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Bread_1 DiningTable_1)
        (inReceptacle Knife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Bread_1)
        (isCool Bread_1)
        (inReceptacle Bread_1 Microwave_1)
    ))
)