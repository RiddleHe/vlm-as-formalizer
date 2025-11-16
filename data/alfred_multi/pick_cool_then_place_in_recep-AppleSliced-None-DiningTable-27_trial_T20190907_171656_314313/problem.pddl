(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Apple_1 - object
        CounterTop_1 - receptacle
        DiningTable_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Apple_1 CounterTop_1)
        (inReceptacle ButterKnife_1 DiningTable_1)
    )
    (:goal (and
        (isSliced Apple_1)
        (isCool Apple_1)
        (inReceptacle Apple_1 DiningTable_1)
    ))
)