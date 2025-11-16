(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        Cabinet_1 - receptacle
        Microwave_1 - microwave
        CoffeeMachine_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 Cabinet_1)
    )
    (:goal (and
        (isHot Mug_1)
        (inReceptacle Mug_1 CoffeeMachine_1)
    ))
)