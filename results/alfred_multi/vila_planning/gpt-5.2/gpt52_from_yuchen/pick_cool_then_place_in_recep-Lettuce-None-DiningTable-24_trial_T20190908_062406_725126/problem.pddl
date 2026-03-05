(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Lettuce_1 - object
        Fridge_1 - fridge
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Lettuce_1 DiningTable_1)
    )
    (:goal (and
        (isCool Lettuce_1)
        (inReceptacle Lettuce_1 DiningTable_1)
    ))
)