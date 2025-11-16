(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Tomato_1 - object
        SideTable_1 - receptacle
        SinkBasin_1 - sink
        Fridge_1 - fridge
        )
    (:init
        (isCool Tomato_1)
        (inReceptacle Tomato_1 Fridge_1)
    )
    (:goal (and
        (isClean Tomato_1)
        (inReceptacle Tomato_1 SideTable_1)
    ))
)