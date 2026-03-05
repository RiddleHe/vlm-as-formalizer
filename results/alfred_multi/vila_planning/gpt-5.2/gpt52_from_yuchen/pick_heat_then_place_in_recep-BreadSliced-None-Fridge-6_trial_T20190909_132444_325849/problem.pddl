(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Bread_1 - object
        CounterTop_1 - receptacle
        Fridge_1 - fridge
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
        (inReceptacle Bread_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Bread_1)
        (isHot Bread_1)
        (inReceptacle Bread_1 Fridge_1)
    ))
)