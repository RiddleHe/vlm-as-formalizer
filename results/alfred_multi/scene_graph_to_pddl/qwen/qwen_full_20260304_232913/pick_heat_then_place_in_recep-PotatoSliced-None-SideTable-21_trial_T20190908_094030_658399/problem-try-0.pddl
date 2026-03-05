(define (problem put_heated_slice_potato_next_to_salt_shaker)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        sink - receptacle
        knife - object
        gray_table - object
        black_table - object
        green_lettuce - object
        brown_bread - object
        white_salt_shaker - object
        brown_egg - object
        yellow_apple - object
        red_potato - object
        white_cup - object
        black_vase - object
        black_trash_bag - object
        brown_cardboard_box - object
    )
    (:init
        (openable microwave)
        (openable sink)
        (isOn microwave)
        (inReceptacle green_lettuce gray_table)
        (inReceptacle brown_bread gray_table)
        (inReceptacle white_salt_shaker black_table)
        (inReceptacle knife black_table)
        (inReceptacle brown_egg black_table)
        (inReceptacle yellow_apple black_table)
        (inReceptacle red_potato black_table)
        (inReceptacle white_cup black_table)
        (inReceptacle black_vase gray_table)
        (inReceptacle black_trash_bag black_table)
        (inReceptacle brown_cardboard_box gray_table)
    )
    (:goal (and
        (inReceptacle red_potato black_table)
        (isSliced red_potato)
        (isHot red_potato)
    ))
)