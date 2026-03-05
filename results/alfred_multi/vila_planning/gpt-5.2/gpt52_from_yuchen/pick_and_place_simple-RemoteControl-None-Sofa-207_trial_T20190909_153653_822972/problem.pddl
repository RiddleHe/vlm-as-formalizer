(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        RemoteControl_1 - object
        CoffeeTable_1 - receptacle
        Sofa_1 - receptacle
        )
    (:init
        (inReceptacle RemoteControl_1 CoffeeTable_1)
    )
    (:goal (and
        (inReceptacle RemoteControl_1 Sofa_1)
    ))
)