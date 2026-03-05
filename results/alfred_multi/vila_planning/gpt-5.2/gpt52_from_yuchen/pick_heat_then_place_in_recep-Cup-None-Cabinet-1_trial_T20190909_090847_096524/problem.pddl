(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Cup_1 - object
        Cabinet_1 - receptacle
        Cabinet_2 - receptacle
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Cup_1 Cabinet_1)
    )
    (:goal (and
        (isHot Cup_1)
        (inReceptacle Cup_1 Cabinet_1)
    ))
)