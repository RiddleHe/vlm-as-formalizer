(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Bread_1 - object
        Bread_2 - object
        Knife_1 - knife
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        DiningTable_1 - receptacle
        Fridge_1 - fridge
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Knife_1 DiningTable_1)
        (inReceptacle Bread_2 DiningTable_1)
        (inReceptacle Bread_1 CounterTop_2)
    )
    (:goal (and
        (isSliced Bread_1)
        (inReceptacle Bread_1 Fridge_1)
        (isSliced Bread_1)
        (inReceptacle Bread_1 Fridge_1)
    ))
)