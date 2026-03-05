(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Plate_1 - receptacle
        Candle_1 - object
        DiningTable_1 - receptacle
        CoffeeTable_1 - receptacle
        )
    (:init
        (inReceptacle Plate_1 DiningTable_1)
        (inReceptacle Candle_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle Candle_1 Plate_1)
        (inReceptacle Plate_1 CoffeeTable_1)
    ))
)