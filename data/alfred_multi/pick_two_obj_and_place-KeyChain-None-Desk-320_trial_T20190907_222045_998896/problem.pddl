(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        KeyChain_2 - object
        KeyChain_1 - object
        Desk_1 - receptacle
        Shelf_1 - receptacle
        )
    (:init
        (inReceptacle KeyChain_1 Shelf_1)
        (inReceptacle KeyChain_2 Shelf_1)
    )
    (:goal (and
        (inReceptacle KeyChain_1 Desk_1)
        (inReceptacle KeyChain_1 Desk_1)
    ))
)