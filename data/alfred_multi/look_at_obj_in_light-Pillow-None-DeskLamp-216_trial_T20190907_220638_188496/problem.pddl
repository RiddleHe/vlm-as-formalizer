(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DeskLamp_1 - object
        Pillow_1 - object
        ArmChair_1 - receptacle
        )
    (:init
        (inReceptacle Pillow_1 ArmChair_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 Pillow_1)
    ))
)