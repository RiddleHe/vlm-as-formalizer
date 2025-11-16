(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Candle_1 - object
        CounterTop_1 - receptacle
        Drawer_1 - receptacle
        )
    (:init
        (inReceptacle Candle_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle Candle_1 Drawer_1)
    ))
)