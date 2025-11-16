(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ButterKnife_1 - knife
        Drawer_1 - receptacle
        SinkBasin_1 - sink
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle ButterKnife_1 CounterTop_1)
    )
    (:goal (and
        (isClean ButterKnife_1)
        (inReceptacle ButterKnife_1 Drawer_1)
    ))
)