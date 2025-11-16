(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Watch_1 - object
        SideTable_1 - receptacle
        )
    (:init
    )
    (:goal (and
        (inReceptacle Watch_1 SideTable_1)
    ))
)