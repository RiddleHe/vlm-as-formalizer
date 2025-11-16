(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SoapBar_1 - object
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        Drawer_1 - receptacle
        )
    (:init
        (inReceptacle SoapBar_1 CounterTop_1)
    )
    (:goal (and
        (isClean SoapBar_1)
        (inReceptacle SoapBar_1 Drawer_1)
    ))
)