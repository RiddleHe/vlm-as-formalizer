(define (problem put_mug_with_spoon_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        black_round_table - receptacle
        small_black_table - receptacle
        white_table - receptacle
        gray_bowl_on_black_table - object
        gray_bowl_on_small_black_table - object
        salt_shaker_on_black_table - object
        salt_shaker_on_small_black_table - object
        brown_bottle_on_small_black_table - object
        silver_mug_on_small_black_table - object
        red_tomato_on_white_table - object
        spoon_on_black_table - object
        spoon_on_white_table - object
        yellow_knife_on_black_table - knife
        knife_on_small_black_table - knife
        black_vase_on_black_table - object
        green_book_on_small_black_table - object
        brown_cabinet_with_green_drawer - object
    )
    (:init
        (inReceptacle gray_bowl_on_black_table black_round_table)
        (inReceptacle salt_shaker_on_black_table black_round_table)
        (inReceptacle black_vase_on_black_table black_round_table)
        (inReceptacle spoon_on_black_table black_round_table)
        (inReceptacle yellow_knife_on_black_table black_round_table)
        (inReceptacle gray_bowl_on_small_black_table small_black_table)
        (inReceptacle salt_shaker_on_small_black_table small_black_table)
        (inReceptacle brown_bottle_on_small_black_table small_black_table)
        (inReceptacle silver_mug_on_small_black_table small_black_table)
        (inReceptacle green_book_on_small_black_table small_black_table)
        (inReceptacle red_tomato_on_white_table white_table)
        (inReceptacle spoon_on_white_table white_table)
        (inReceptacle knife_on_small_black_table small_black_table)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle silver_mug_on_small_black_table black_round_table)
        (inReceptacle spoon_on_black_table silver_mug_on_small_black_table)
    ))
)