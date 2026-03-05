(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        CoffeeMachine_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Mug_1 CoffeeMachine_1)
    )
    (:goal (and
        (isCool Mug_1)
        (inReceptacle Mug_1 CoffeeMachine_1)
    ))
)