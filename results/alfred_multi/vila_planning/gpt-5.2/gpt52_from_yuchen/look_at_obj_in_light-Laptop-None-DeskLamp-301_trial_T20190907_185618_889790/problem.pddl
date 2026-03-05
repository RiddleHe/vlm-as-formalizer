(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DeskLamp_1 - object
        Laptop_1 - object
        Bed_1 - receptacle
        )
    (:init
        (inReceptacle Laptop_1 Bed_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 Laptop_1)
    ))
)