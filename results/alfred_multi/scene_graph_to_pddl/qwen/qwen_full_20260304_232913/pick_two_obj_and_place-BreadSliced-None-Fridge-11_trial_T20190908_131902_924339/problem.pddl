(define (problem put_sliced_bread_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge - fridge
        red_microwave - microwave
        stainless_steel_sink - sink
        yellow_knife - knife
        loaf_of_bread - object
        tomato - object
        apple - object
        egg - object
        salt_shaker - object
        fork - object
        paper_towel_roll - object
        pan - object
        kettle - object
        green_book - object
        black_cup - object
        metal_bowl - object
        wooden_stool - object
        countertop - receptacle
        table - receptacle
        oven - receptacle
        stove - receptacle
        cabinet - receptacle
    )
    (:init
        (openable black_fridge)
        (openable red_microwave)
        (openable stainless_steel_sink)
        (inReceptacle salt_shaker countertop)
        (inReceptacle loaf_of_bread countertop)
        (inReceptacle loaf_of_bread table)
        (inReceptacle tomato table)
        (inReceptacle apple table)
        (inReceptacle egg table)
        (inReceptacle black_cup table)
        (inReceptacle metal_bowl table)
        (inReceptacle green_book table)
        (inReceptacle yellow_knife table)
        (inReceptacle fork countertop)
        (inReceptacle paper_towel_roll countertop)
        (inReceptacle pan stove)
        (inReceptacle kettle stove)
        (not (isSliced loaf_of_bread))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle loaf_of_bread black_fridge)
        (isSliced loaf_of_bread)
    ))
)