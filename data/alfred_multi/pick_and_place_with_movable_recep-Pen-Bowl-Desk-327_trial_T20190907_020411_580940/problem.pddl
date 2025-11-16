(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pen_1 - object
        Bowl_1 - receptacle
        Desk_1 - receptacle
        Shelf_1 - receptacle
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle Pen_1 Dresser_1)
        (inReceptacle Bowl_1 Shelf_1)
    )
    (:goal (and
        (inReceptacle Pen_1 Bowl_1)
        (inReceptacle Bowl_1 Desk_1)
    ))
)