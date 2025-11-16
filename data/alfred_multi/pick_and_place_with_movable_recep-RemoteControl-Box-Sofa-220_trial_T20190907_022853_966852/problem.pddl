(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        RemoteControl_1 - object
        Box_1 - receptacle
        Sofa_1 - receptacle
        CoffeeTable_1 - receptacle
        )
    (:init
        (inReceptacle RemoteControl_1 CoffeeTable_1)
        (inReceptacle Box_1 CoffeeTable_1)
    )
    (:goal (and
        (inReceptacle RemoteControl_1 Box_1)
        (inReceptacle Box_1 Sofa_1)
    ))
)