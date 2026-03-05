(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        Microwave_1 - microwave
        Fridge_1 - fridge
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 CounterTop_1)
    )
    (:goal (and
        (isCool Tomato_1)
        (inReceptacle Tomato_1 Microwave_1)
    ))
)