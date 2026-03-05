(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bread_1 - object
        Knife_1 - knife
        Microwave_1 - microwave
        CounterTop_2 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Bread_1 CounterTop_2)
        (inReceptacle Knife_1 CounterTop_1)
    )
    (:goal (and
        (isSliced Bread_1)
        (isHot Bread_1)
        (inReceptacle Bread_1 CounterTop_1)
    ))
)