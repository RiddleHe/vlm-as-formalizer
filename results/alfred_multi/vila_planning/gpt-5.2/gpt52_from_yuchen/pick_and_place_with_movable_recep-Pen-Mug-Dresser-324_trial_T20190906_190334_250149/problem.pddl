(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Mug_1 - receptacle
        Pen_1 - object
        Shelf_1 - receptacle
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle Mug_1 Shelf_1)
        (inReceptacle Pen_1 Dresser_1)
    )
    (:goal (and
        (inReceptacle Pen_1 Mug_1)
        (inReceptacle Mug_1 Dresser_1)
    ))
)