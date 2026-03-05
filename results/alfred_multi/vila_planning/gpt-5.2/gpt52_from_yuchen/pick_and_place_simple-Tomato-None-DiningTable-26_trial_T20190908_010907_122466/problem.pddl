(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        Fridge_1 - fridge
        DiningTable_1 - receptacle
        )
    (:init
        (isCool Tomato_1)
        (inReceptacle Tomato_1 Fridge_1)
    )
    (:goal (and
        (inReceptacle Tomato_1 DiningTable_1)
    ))
)