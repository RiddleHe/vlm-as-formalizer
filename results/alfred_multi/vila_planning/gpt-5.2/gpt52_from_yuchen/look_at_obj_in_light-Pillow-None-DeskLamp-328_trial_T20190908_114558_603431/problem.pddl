(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pillow_1 - object
        DeskLamp_1 - object
        Bed_1 - receptacle
        )
    (:init
        (inReceptacle Pillow_1 Bed_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 Pillow_1)
    ))
)