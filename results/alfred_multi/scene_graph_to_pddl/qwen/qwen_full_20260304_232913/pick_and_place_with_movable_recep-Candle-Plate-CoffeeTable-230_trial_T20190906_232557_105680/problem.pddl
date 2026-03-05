(define (problem put_plate_with_candle_on_coffee_table)
    (:domain put_task)
    (:objects
        agent
        grey_plate_1
        grey_plate_2
        tissue_box
        open_cardboard_box
        candle
        laptop
        newspaper_1
        newspaper_2
        remote_control
        blue_cup
        green_cup
        potted_plant
        statue
        microwave
        fridge
        sink
        knife
    )
    (:init
        (openable tissue_box)
        (openable open_cardboard_box)
        (opened tissue_box)
        (opened open_cardboard_box)
        (inReceptacle candle tissue_box)
        (inReceptacle remote_control grey_plate_1)
        (inReceptacle newspaper_1 grey_plate_1)
        (inReceptacle newspaper_2 grey_plate_2)
        (not (holdsAny agent))
        (not (atLocation agent grey_plate_1))
        (not (atLocation agent grey_plate_2))
        (not (atLocation agent tissue_box))
        (not (atLocation agent open_cardboard_box))
        (not (atLocation agent candle))
        (not (atLocation agent laptop))
        (not (atLocation agent newspaper_1))
        (not (atLocation agent newspaper_2))
        (not (atLocation agent remote_control))
        (not (atLocation agent blue_cup))
        (not (atLocation agent green_cup))
        (not (atLocation agent potted_plant))
        (not (atLocation agent statue))
        (not (atLocation agent microwave))
        (not (atLocation agent fridge))
        (not (atLocation agent sink))
        (not (atLocation agent knife))
    )
    (:goal (and
        (inReceptacle candle grey_plate_1)
        (inReceptacle grey_plate_1 open_cardboard_box)
    ))
)