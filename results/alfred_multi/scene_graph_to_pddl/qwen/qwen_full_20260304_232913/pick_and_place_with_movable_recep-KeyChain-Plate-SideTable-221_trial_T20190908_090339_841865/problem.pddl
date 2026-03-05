(define (problem put_plate_with_keys_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        white_table - receptacle
        white_chair - receptacle
        yellow_couch - receptacle
        black_monitor - receptacle
        brown_plate - object
        black_keys - object
        blue_book - object
        gray_remote - object
        silver_laptop - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (inReceptacle brown_plate white_table)
        (inReceptacle black_keys white_table)
        (inReceptacle blue_book white_table)
        (inReceptacle gray_remote white_table)
        (inReceptacle silver_laptop white_table)
    )
    (:goal
        (and
            (inReceptacle brown_plate white_table)
            (inReceptacle black_keys brown_plate)
        )
    )
)