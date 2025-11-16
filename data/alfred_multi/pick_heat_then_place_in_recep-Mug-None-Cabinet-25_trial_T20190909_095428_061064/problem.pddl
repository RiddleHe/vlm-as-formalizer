(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - object
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 CounterTop_1)
    )
    (:goal (and
        (isHot Mug_1)
        (inReceptacle Mug_1 Cabinet_1)
    ))
)