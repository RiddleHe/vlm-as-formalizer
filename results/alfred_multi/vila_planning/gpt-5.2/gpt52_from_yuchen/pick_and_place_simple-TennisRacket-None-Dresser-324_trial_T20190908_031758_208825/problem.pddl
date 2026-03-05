(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        TennisRacket_1 - object
        Dresser_1 - receptacle
        )
    (:init
    )
    (:goal (and
        (inReceptacle TennisRacket_1 Dresser_1)
    ))
)