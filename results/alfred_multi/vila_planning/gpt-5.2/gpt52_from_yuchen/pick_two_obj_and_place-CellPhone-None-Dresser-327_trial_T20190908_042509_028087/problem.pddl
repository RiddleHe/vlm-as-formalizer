(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CellPhone_1 - object
        CellPhone_2 - object
        Bed_1 - receptacle
        Shelf_1 - receptacle
        Dresser_1 - receptacle
        )
    (:init
        (inReceptacle CellPhone_2 Bed_1)
        (inReceptacle CellPhone_1 Shelf_1)
    )
    (:goal (and
        (inReceptacle CellPhone_1 Dresser_1)
        (inReceptacle CellPhone_1 Dresser_1)
    ))
)