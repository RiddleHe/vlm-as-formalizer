(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pen_1 - object
        Shelf_1 - receptacle
        GarbageCan_1 - receptacle
        )
    (:init
        (inReceptacle Pen_1 GarbageCan_1)
    )
    (:goal (and
        (inReceptacle Pen_1 Shelf_1)
    ))
)