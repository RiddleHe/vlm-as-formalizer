(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - object
        DiningTable_1 - receptacle
        SinkBasin_1 - sink
        )
    (:init
        (inReceptacle Bowl_1 DiningTable_1)
    )
    (:goal (and
        (isClean Bowl_1)
        (inReceptacle Bowl_1 DiningTable_1)
    ))
)