(define (problem cut_cook_apple)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife_on_sink - knife
        knife_on_table - knife
        black_table - receptacle
        brown_table - receptacle
        black_shelf - receptacle
        white_table - receptacle
        green_cabinet - receptacle
        silver_microwave - receptacle
        stainless_sink - receptacle
        white_dishwasher - receptacle
        apple_on_sink - object
        apple_on_table - object
        apple_on_shelf - object
        tomato_on_sink - object
        tomato_on_counter - object
        bread_on_table - object
        bread_on_shelf - object
        salt_shaker - object
        spoon - object
        plate - object
        cup - object
        green_lettuce - object
        black_vase - object
        red_toaster - object
        purple_towel - object
        brown_cabinet - object
        wooden_counter - object
        tiled_floor - object
        window - object
        bottle - object
        fork - object
        pan - object
        stove - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable dishwasher)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (opened dishwasher)
        (isOn red_toaster)
        (isOn stove)
        (isToggled red_toaster)
        (isToggled stove)
        (inReceptacle knife_on_sink sink)
        (inReceptacle tomato_on_sink sink)
        (inReceptacle apple_on_sink sink)
        (inReceptacle apple_on_table black_table)
        (inReceptacle bread_on_table black_table)
        (inReceptacle salt_shaker black_table)
        (inReceptacle spoon black_table)
        (inReceptacle plate black_table)
        (inReceptacle cup black_table)
        (inReceptacle green_lettuce black_table)
        (inReceptacle apple_on_shelf black_shelf)
        (inReceptacle bread_on_shelf white_table)
        (inReceptacle black_vase white_table)
        (inReceptacle tomato_on_counter wooden_counter)
        (inReceptacle fork wooden_counter)
        (inReceptacle pan stove)
        (atLocation agent black_table)
    )
    (:goal (and
        (isSliced apple_on_table)
        (isHot apple_on_table)
        (inReceptacle apple_on_table black_shelf)
    ))
)