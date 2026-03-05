(define (problem place_cooled_bread_slice_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        red_microwave - microwave
        dark_grey_fridge - fridge
        kitchen_sink - sink
        yellow_handled_knife - knife
        round_white_table - receptacle
        wooden_countertop - receptacle
        red_tomato - object
        brown_bread_loaf - object
        brown_bread_slice - object
        salt_shaker - object
        pepper_shaker - object
        green_book - object
        metal_spoon - object
        metal_cup - object
        wine_bottle - object
        egg - object
        paper_towel_roll - object
        toaster - object
        log - object
    )
    (:init
        (openable dark_grey_fridge)
        (openable red_microwave)
        (isOn red_microwave)
        (isOn toaster)
        (isToggled red_microwave)
        (isToggled toaster)
        (atLocation robot round_white_table)
        (inReceptacle brown_bread_slice round_white_table)
        (inReceptacle red_tomato round_white_table)
        (inReceptacle salt_shaker round_white_table)
        (inReceptacle pepper_shaker round_white_table)
        (inReceptacle green_book round_white_table)
        (inReceptacle metal_spoon round_white_table)
        (inReceptacle metal_cup round_white_table)
        (inReceptacle wine_bottle round_white_table)
        (inReceptacle egg round_white_table)
        (inReceptacle paper_towel_roll round_white_table)
        (inReceptacle brown_bread_loaf round_white_table)
        (inReceptacle red_tomato wooden_countertop)
        (inReceptacle salt_shaker wooden_countertop)
        (inReceptacle yellow_handled_knife wooden_countertop)
        (inReceptacle metal_spoon wooden_countertop)
        (inReceptacle toaster wooden_countertop)
        (inReceptacle log wooden_countertop)
    )
    (:goal (and
        (inReceptacle brown_bread_slice red_microwave)
        (isCool brown_bread_slice)
    ))
)