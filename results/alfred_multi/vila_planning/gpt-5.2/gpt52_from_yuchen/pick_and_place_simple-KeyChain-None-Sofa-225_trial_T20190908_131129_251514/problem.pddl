(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        KeyChain_1 - object
        Sofa_1 - receptacle
        SideTable_1 - receptacle
        )
    (:init
        (inReceptacle KeyChain_1 SideTable_1)
    )
    (:goal (and
        (inReceptacle KeyChain_1 Sofa_1)
    ))
)