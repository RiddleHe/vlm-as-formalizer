(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        Shelf_1 - receptacle
        Fridge_1 - fridge
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 CounterTop_1)
    )
    (:goal (and
        (isCool Mug_1)
        (inReceptacle Mug_1 Shelf_1)
    ))
)