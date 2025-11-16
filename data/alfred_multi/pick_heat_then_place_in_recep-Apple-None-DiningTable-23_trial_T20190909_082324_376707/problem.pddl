(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Apple_1 - object
        Microwave_1 - microwave
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Apple_1 DiningTable_1)
    )
    (:goal (and
        (isHot Apple_1)
        (inReceptacle Apple_1 DiningTable_1)
    ))
)