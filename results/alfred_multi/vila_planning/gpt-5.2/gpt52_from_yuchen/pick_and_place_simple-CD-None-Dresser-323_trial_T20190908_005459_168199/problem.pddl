(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CD_1 - object
        Desk_1 - receptacle
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle CD_1 Desk_1)
    )
    (:goal (and
        (inReceptacle CD_1 Dresser_1)
    ))
)