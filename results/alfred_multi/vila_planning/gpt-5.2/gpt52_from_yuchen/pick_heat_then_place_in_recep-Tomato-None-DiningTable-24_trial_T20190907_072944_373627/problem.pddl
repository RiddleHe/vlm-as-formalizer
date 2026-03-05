(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        DiningTable_1 - receptacle
        Microwave_1 - microwave
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Tomato_1 CounterTop_1)
    )
    (:goal (and
        (isHot Tomato_1)
        (inReceptacle Tomato_1 DiningTable_1)
    ))
)