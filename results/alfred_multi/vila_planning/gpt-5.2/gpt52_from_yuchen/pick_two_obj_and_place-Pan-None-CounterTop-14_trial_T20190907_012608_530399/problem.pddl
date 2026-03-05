(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pan_1 - object
        Pan_2 - object
        StoveBurner_2 - receptacle
        StoveBurner_1 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle Pan_1 StoveBurner_1)
        (inReceptacle Pan_2 StoveBurner_2)
    )
    (:goal (and
        (inReceptacle Pan_1 CounterTop_1)
        (inReceptacle Pan_1 CounterTop_1)
    ))
)