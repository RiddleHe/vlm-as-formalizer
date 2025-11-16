(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Apple_1 - object
        SideTable_1 - receptacle
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Apple_1 SideTable_1)
    )
    (:goal (and
        (isHot Apple_1)
        (inReceptacle Apple_1 SideTable_1)
    ))
)