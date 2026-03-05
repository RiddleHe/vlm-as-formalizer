(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Watch_1 - object
        Watch_2 - object
        DiningTable_1 - receptacle
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle Watch_2 DiningTable_1)
        (inReceptacle Watch_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle Watch_1 Dresser_1)
        (inReceptacle Watch_1 Dresser_1)
    ))
)