(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        KeyChain_1 - object
        ArmChair_1 - receptacle
        Desk_1 - receptacle
        )
    (:init
        (inReceptacle KeyChain_1 Desk_1)
    )
    (:goal (and
        (inReceptacle KeyChain_1 ArmChair_1)
    ))
)