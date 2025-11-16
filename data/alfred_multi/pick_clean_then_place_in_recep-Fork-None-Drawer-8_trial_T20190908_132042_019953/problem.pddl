(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Fork_1 - object
        SinkBasin_1 - sink
        CounterTop_1 - receptacle
        Drawer_1 - receptacle
        )
    (:init
        (inReceptacle Fork_1 CounterTop_1)
    )
    (:goal (and
        (isClean Fork_1)
        (inReceptacle Fork_1 Drawer_1)
    ))
)