(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Potato_1 - object
        Pan_1 - receptacle
        Fridge_1 - fridge
        Microwave_1 - microwave
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Potato_1 Microwave_1)
        (inReceptacle Pan_1 CounterTop_2)
        (inReceptacle ButterKnife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Potato_1)
        (inReceptacle Potato_1 Pan_1)
        (inReceptacle Pan_1 Fridge_1)
    ))
)