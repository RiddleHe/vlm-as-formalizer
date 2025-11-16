(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        CoffeeMachine_1 - receptacle
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Mug_1 CounterTop_1)
        (inReceptacle Mug_1 CoffeeMachine_1)
    )
    (:goal (and
        (isClean Mug_1)
        (inReceptacle Mug_1 CoffeeMachine_1)
    ))
)