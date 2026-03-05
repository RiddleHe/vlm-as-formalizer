(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        RemoteControl_1 - object
        FloorLamp_1 - object
        Sofa_1 - receptacle
        )
    (:init
        (inReceptacle RemoteControl_1 Sofa_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 RemoteControl_1)
    ))
)