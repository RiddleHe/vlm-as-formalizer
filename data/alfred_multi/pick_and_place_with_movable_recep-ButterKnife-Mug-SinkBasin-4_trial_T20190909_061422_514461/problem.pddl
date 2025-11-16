(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - receptacle
        ButterKnife_1 - knife
        SinkBasin_1 - sink
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 DiningTable_1)
        (inReceptacle ButterKnife_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle ButterKnife_1 Mug_1)
        (inReceptacle Mug_1 SinkBasin_1)
    ))
)