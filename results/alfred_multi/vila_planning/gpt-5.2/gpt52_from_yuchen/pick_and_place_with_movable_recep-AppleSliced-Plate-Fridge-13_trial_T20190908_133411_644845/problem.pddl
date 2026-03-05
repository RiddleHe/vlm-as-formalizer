(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Knife_1 - knife
        Plate_1 - receptacle
        Apple_1 - object
        CounterTop_1 - receptacle
        CounterTop_2 - receptacle
        Fridge_1 - fridge
        Microwave_1 - microwave
        )
    (:init
        (inReceptacle Knife_1 CounterTop_1)
        (inReceptacle Plate_1 CounterTop_2)
        (inReceptacle Apple_1 Microwave_1)
    )
    (:goal (and
        (isSliced Apple_1)
        (inReceptacle Apple_1 Plate_1)
        (inReceptacle Plate_1 Fridge_1)
    ))
)