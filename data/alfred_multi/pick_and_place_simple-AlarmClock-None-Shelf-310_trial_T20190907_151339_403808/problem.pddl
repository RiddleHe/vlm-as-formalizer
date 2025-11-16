(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        AlarmClock_1 - object
        Shelf_1 - receptacle
        Desk_1 - receptacle
        )
    (:init
        (inReceptacle AlarmClock_1 Desk_1)
    )
    (:goal (and
        (inReceptacle AlarmClock_1 Shelf_1)
    ))
)