(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Egg_1 - object
        CounterTop_1 - receptacle
        SinkBasin_1 - sink
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Egg_1 Microwave_1)
    )
    (:goal (and
        (isClean Egg_1)
        (inReceptacle Egg_1 CounterTop_1)
    ))
)