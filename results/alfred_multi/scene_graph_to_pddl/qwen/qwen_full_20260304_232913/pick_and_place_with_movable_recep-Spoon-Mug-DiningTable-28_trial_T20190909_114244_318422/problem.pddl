(define (problem put_mug_with_spoon_on_table)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_black_table
        knife_on_small_table
        black_round_table
        white_table
        small_black_table
        blue_bowl_on_black_table
        blue_bowl_on_small_table
        salt_shaker_on_black_table
        salt_shaker_on_small_table
        brown_bottle_on_small_table
        silver_mug_on_small_table
        black_vase_on_black_table
        green_book_on_small_table
        red_tomato_on_white_table
        black_tray_on_white_table
        spoon_on_black_table
        spoon_on_white_table
    )
    (:init
        (atLocation agent black_round_table) ; assuming agent starts near black table for simplicity; adjust if needed
        (inReceptacle blue_bowl_on_black_table black_round_table)
        (inReceptacle salt_shaker_on_black_table black_round_table)
        (inReceptacle black_vase_on_black_table black_round_table)
        (inReceptacle spoon_on_black_table black_round_table)
        (inReceptacle knife_on_black_table black_round_table)
        (inReceptacle blue_bowl_on_small_table small_black_table)
        (inReceptacle salt_shaker_on_small_table small_black_table)
        (inReceptacle brown_bottle_on_small_table small_black_table)
        (inReceptacle silver_mug_on_small_table small_black_table)
        (inReceptacle green_book_on_small_table small_black_table)
        (inReceptacle knife_on_small_table small_black_table)
        (inReceptacle red_tomato_on_white_table white_table)
        (inReceptacle black_tray_on_white_table white_table)
        (inReceptacle spoon_on_white_table white_table)
        (not (holdsAny agent))
    )
    (:goal
        (and
            (inReceptacle silver_mug_on_small_table black_round_table)
            (inReceptacle spoon_on_white_table silver_mug_on_small_table)
        )
    )
)