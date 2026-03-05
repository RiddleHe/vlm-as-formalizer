(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Book_2 - object
        Book_1 - object
        Desk_1 - receptacle
        Bed_1 - receptacle
        )
    (:init
        (inReceptacle Book_2 Bed_1)
        (inReceptacle Book_1 Bed_1)
    )
    (:goal (and
        (inReceptacle Book_1 Desk_1)
        (inReceptacle Book_1 Desk_1)
    ))
)