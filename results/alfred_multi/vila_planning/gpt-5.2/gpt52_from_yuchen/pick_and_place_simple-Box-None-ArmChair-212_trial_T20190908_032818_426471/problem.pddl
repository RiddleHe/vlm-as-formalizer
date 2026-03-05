(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Box_1 - object
        ArmChair_1 - receptacle
        )
    (:init
    )
    (:goal (and
        (inReceptacle Box_1 ArmChair_1)
    ))
)