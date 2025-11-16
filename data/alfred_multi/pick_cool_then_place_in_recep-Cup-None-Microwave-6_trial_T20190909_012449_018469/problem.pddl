(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cup_1 - object
        Fridge_1 - fridge
        Microwave_1 - microwave
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle Cup_1 Cabinet_1)
    )
    (:goal (and
        (isCool Cup_1)
        (inReceptacle Cup_1 Microwave_1)
    ))
)