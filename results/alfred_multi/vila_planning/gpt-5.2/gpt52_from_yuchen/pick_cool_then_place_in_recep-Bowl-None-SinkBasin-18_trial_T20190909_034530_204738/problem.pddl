(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - object
        Fridge_1 - fridge
        SinkBasin_1 - sink
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Bowl_1 DiningTable_1)
    )
    (:goal (and
        (isCool Bowl_1)
        (inReceptacle Bowl_1 SinkBasin_1)
    ))
)