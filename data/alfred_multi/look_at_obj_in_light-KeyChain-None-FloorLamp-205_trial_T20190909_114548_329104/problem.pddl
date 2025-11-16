(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        FloorLamp_1 - object
        KeyChain_1 - object
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle KeyChain_1 DiningTable_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 KeyChain_1)
    ))
)