(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pillow_1 - object
        Pillow_2 - object
        Ottoman_1 - receptacle
        Sofa_1 - receptacle
        ArmChair_1 - receptacle
        )
    (:init
        (inReceptacle Pillow_2 ArmChair_1)
        (inReceptacle Pillow_1 Sofa_1)
    )
    (:goal (and
        (inReceptacle Pillow_1 Ottoman_1)
        (inReceptacle Pillow_1 Ottoman_1)
    ))
)