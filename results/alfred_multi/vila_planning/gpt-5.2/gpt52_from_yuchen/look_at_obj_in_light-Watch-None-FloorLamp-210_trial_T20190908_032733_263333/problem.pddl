(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        FloorLamp_1 - object
        Watch_1 - object
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle Watch_1 Dresser_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 Watch_1)
    ))
)