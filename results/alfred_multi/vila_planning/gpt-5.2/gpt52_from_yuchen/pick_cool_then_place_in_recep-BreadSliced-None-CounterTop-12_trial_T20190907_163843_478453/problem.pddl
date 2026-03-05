(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Bread_1 - object
        Fridge_1 - fridge
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Bread_1 CounterTop_2)
        (inReceptacle ButterKnife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Bread_1)
        (isCool Bread_1)
        (inReceptacle Bread_1 CounterTop_1)
    ))
)