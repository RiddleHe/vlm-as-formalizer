(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CD_2 - object
        CD_1 - object
        Shelf_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle CD_2 DiningTable_1)
        (inReceptacle CD_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle CD_1 Shelf_1)
        (inReceptacle CD_1 Shelf_1)
    ))
)