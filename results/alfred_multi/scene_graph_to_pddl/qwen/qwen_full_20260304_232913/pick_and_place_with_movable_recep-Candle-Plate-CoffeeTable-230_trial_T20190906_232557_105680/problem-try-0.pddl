(define (problem put_plate_with_candle_on_coffee_table)
    (:domain put_task)
    (:objects
        agent
        grey_plate_1
        grey_plate_2
        tissue_box
        cardboard_box
        laptop
        remote_control
        newspaper_1
        newspaper_2
        green_candle
        blue_card
        potted_plant
        vase
        microwave
        fridge
        sink
        knife
    )
    (:init
        (atLocation agent grey_plate_1) ; agent starts near grey_plate_1 for simplicity
        (inReceptacle green_candle tissue_box)
        (inReceptacle blue_card cardboard_box)
        (openable tissue_box)
        (openable cardboard_box)
        (not (opened tissue_box))
        (not (opened cardboard_box))
        (not (holdsAny agent))
    )
    (:goal
        (and
            (inReceptacle green_candle grey_plate_1)
            (inReceptacle grey_plate_1 potted_plant) ; assuming potted_plant is on coffee table as per scene graph
        )
    )
)