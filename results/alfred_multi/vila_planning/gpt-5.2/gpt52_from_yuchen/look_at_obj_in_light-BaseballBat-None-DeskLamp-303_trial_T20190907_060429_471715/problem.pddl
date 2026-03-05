(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        BaseballBat_1 - object
        DeskLamp_1 - object
        )
    (:init
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 BaseballBat_1)
    ))
)