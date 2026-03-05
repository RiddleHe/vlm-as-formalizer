(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Pan_1 - receptacle
        Tomato_1 - object
        DiningTable_1 - receptacle
        StoveBurner_1 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 DiningTable_1)
        (inReceptacle ButterKnife_1 DiningTable_1)
        (inReceptacle Pan_1 StoveBurner_1)
    )
    (:goal (and
        (isSliced Tomato_1)
        (inReceptacle Tomato_1 Pan_1)
        (inReceptacle Pan_1 DiningTable_1)
    ))
)