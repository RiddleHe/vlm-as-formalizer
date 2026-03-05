(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Plate_1 - object
        Fridge_1 - fridge
        Cabinet_1 - receptacle
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Plate_1 Cabinet_1)
    )
    (:goal (and
        (isHot Plate_1)
        (inReceptacle Plate_1 Fridge_1)
    ))
)