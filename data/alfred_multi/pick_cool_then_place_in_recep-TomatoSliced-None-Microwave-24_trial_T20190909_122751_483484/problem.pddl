(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        Knife_1 - knife
        Fridge_1 - fridge
        Microwave_1 - microwave
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 CounterTop_2)
        (inReceptacle Knife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Tomato_1)
        (isCool Tomato_1)
        (inReceptacle Tomato_1 Microwave_1)
    ))
)