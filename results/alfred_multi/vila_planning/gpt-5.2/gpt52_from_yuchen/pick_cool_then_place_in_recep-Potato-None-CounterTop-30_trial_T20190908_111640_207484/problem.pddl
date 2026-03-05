(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Potato_1 - object
        Fridge_1 - fridge
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Potato_1 Microwave_1)
    )
    (:goal (and
        (isCool Potato_1)
        (inReceptacle Potato_1 CounterTop_1)
    ))
)