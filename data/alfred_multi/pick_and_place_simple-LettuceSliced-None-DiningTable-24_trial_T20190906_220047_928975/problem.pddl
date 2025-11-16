(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Knife_1 - knife
        Lettuce_1 - object
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Lettuce_1 DiningTable_1)
        (inReceptacle Knife_1 DiningTable_1)
    )
    (:goal (and
        (isSliced Lettuce_1)
        (inReceptacle Lettuce_1 DiningTable_1)
    ))
)