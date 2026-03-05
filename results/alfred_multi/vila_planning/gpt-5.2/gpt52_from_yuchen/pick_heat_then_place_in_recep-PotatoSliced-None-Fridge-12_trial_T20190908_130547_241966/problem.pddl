(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Potato_1 - object
        ButterKnife_1 - knife
        Fridge_1 - fridge
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Potato_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Potato_1)
        (isHot Potato_1)
        (inReceptacle Potato_1 Fridge_1)
    ))
)