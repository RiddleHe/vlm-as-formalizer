(define (problem put_plate_with_candle_on_coffee_table)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        grey_plate_1
        grey_plate_2
        tissue_box
        open_cardboard_box
        laptop
        remote_control
        newspaper_1
        newspaper_2
        green_candle
        blue_card
        potted_plant
        statue
    )
    (:init
        (openable tissue_box)
        (openable open_cardboard_box)
        (opened tissue_box)
        (opened open_cardboard_box)
        (isOn laptop)
        (isToggled laptop)
        (inReceptacle green_candle tissue_box)
        (inReceptacle blue_card open_cardboard_box)
        (atLocation agent laptop) ; assuming agent starts near laptop as a default starting point
    )
    (:goal
        (and
            (inReceptacle green_candle grey_plate_1)
            (inReceptacle grey_plate_1 potted_plant) ; assuming potted_plant represents the coffee table as per scene context
        )
    )
)