(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        Microwave_1 - microwave
        SideTable_1 - receptacle
        CoffeeMachine_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 CoffeeMachine_1)
    )
    (:goal (and
        (isHot Mug_1)
        (inReceptacle Mug_1 SideTable_1)
    ))
)