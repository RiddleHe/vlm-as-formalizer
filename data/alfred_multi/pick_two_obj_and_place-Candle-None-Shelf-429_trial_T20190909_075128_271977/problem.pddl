(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Candle_1 - object
        Candle_2 - object
        Shelf_1 - receptacle
        Toilet_1 - receptacle
        )
    (:init
        (inReceptacle Candle_2 Toilet_1)
        (inReceptacle Candle_1 Toilet_1)
    )
    (:goal (and
        (inReceptacle Candle_1 Shelf_1)
        (inReceptacle Candle_1 Shelf_1)
    ))
)