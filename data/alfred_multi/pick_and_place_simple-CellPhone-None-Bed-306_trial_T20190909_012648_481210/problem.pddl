(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CellPhone_1 - object
        Bed_1 - receptacle
        Desk_1 - receptacle
        )
    (:init
        (inReceptacle CellPhone_1 Desk_1)
    )
    (:goal (and
        (inReceptacle CellPhone_1 Bed_1)
    ))
)