(define (problem cleanup_knife_mug)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        gray_mug - object
        wooden_table - object
        countertop - object
        green_lettuce - object
        brown_bread - object
        egg - object
        potato - object
        gray_plate - object
        red_frying_pan - object
        salt_shaker - object
        spoon - object
        spatula - object
        metal_cup - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (atLocation agent wooden_table) ; agent starts at table as it's the main scene
        (inReceptacle green_lettuce wooden_table)
        (inReceptacle brown_bread wooden_table)
        (inReceptacle egg wooden_table)
        (inReceptacle potato wooden_table)
        (inReceptacle gray_plate wooden_table)
        (inReceptacle red_frying_pan wooden_table)
        (inReceptacle gray_mug wooden_table)
        (inReceptacle salt_shaker wooden_table)
        (inReceptacle spoon wooden_table)
        (inReceptacle spatula wooden_table)
        (inReceptacle knife wooden_table)
        (inReceptacle gray_mug countertop)
        (inReceptacle metal_cup countertop)
        (inReceptacle salt_shaker countertop)
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle knife sink)
        (inReceptacle gray_mug sink)
        (isClean knife)
        (isClean gray_mug)
    ))
)