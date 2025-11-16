(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Statue_1 - object
        Statue_2 - object
        SideTable_1 - receptacle
        CoffeeTable_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Statue_2 SideTable_1)
        (inReceptacle Statue_1 CoffeeTable_1)
    )
    (:goal (and
        (inReceptacle Statue_1 DiningTable_1)
        (inReceptacle Statue_1 DiningTable_1)
    ))
)