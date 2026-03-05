(define (problem put_mug_with_spoon_on_table)
    (:domain put_task)
    (:objects
        agent
        black_round_table
        small_black_table
        white_table
        gray_bowl_on_black_table
        gray_bowl_on_small_black_table
        salt_shaker_on_black_table
        salt_shaker_on_small_black_table
        brown_bottle_on_small_black_table
        brown_bottle_on_small_black_table_top
        silver_mug_on_small_black_table
        yellow_knife_on_black_table
        knife_on_small_black_table
        red_tomato_on_white_table
        spoon_on_black_table
        spoon_on_white_table
        black_vase_on_black_table
    )
    (:init
        (atLocation agent black_round_table) ; assuming agent starts near black_round_table for efficiency
        (inReceptacle gray_bowl_on_black_table black_round_table)
        (inReceptacle salt_shaker_on_black_table black_round_table)
        (inReceptacle yellow_knife_on_black_table black_round_table)
        (inReceptacle spoon_on_black_table black_round_table)
        (inReceptacle black_vase_on_black_table black_round_table)
        (inReceptacle gray_bowl_on_small_black_table small_black_table)
        (inReceptacle salt_shaker_on_small_black_table small_black_table)
        (inReceptacle brown_bottle_on_small_black_table small_black_table)
        (inReceptacle brown_bottle_on_small_black_table_top small_black_table)
        (inReceptacle silver_mug_on_small_black_table small_black_table)
        (inReceptacle knife_on_small_black_table small_black_table)
        (inReceptacle red_tomato_on_white_table white_table)
        (inReceptacle spoon_on_white_table white_table)
    )
    (:goal (and
        (inReceptacle silver_mug_on_small_black_table black_round_table)
        (inReceptacle spoon_on_white_table silver_mug_on_small_black_table)
    ))
)