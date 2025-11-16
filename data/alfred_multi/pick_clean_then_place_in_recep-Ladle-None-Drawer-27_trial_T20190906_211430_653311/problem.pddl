(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Ladle_1 - object
        Drawer_1 - receptacle
        Cabinet_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Ladle_1 Cabinet_1)
    )
    (:goal (and
        (isClean Ladle_1)
        (inReceptacle Ladle_1 Drawer_1)
    ))
)