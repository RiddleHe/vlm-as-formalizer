(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DeskLamp_1 - object
        Newspaper_1 - object
        Sofa_1 - receptacle
        )
    (:init
        (inReceptacle Newspaper_1 Sofa_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 Newspaper_1)
    ))
)