(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        SoapBar_1 - object
        SoapBar_2 - object
        Toilet_1 - receptacle
        SinkBasin_1 - sink
        Cart_1 - receptacle
        )
    (:init
        (inReceptacle SoapBar_1 SinkBasin_1)
        (inReceptacle SoapBar_2 Toilet_1)
    )
    (:goal (and
        (inReceptacle SoapBar_1 Cart_1)
        (inReceptacle SoapBar_1 Cart_1)
    ))
)