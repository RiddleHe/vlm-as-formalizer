(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SoapBar_1 - object
        Toilet_1 - receptacle
        BathtubBasin_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle SoapBar_1 BathtubBasin_1)
    )
    (:goal (and
        (isClean SoapBar_1)
        (inReceptacle SoapBar_1 Toilet_1)
    ))
)