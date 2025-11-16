(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        DeskLamp_1 - object
        CD_1 - object
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle CD_1 Dresser_1)
    )
    (:goal (and
        (isToggled DeskLamp_1)
        (atLocation agent1 DeskLamp_1)
        (holds agent1 CD_1)
    ))
)