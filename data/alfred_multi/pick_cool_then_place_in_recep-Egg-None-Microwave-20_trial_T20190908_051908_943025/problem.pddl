(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Egg_1 - object
        Microwave_1 - microwave
        Fridge_1 - fridge
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Egg_1 DiningTable_1)
    )
    (:goal (and
        (isCool Egg_1)
        (inReceptacle Egg_1 Microwave_1)
    ))
)