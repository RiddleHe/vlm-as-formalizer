(define (problem fill_pan_with_water_and_put_on_island)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge - fridge
        kitchen_sink - sink
        metal_pan - receptacle
        square_bowl1 - receptacle
        square_bowl2 - receptacle
        green_table - receptacle
        silver_knife - knife
        green_bottle - object
        clear_bottle - object
        red_apple - object
    )
    (:init
        (openable black_fridge)
        (openable kitchen_sink)
        (inReceptacle metal_pan green_table)
        (inReceptacle square_bowl1 green_table)
        (inReceptacle square_bowl2 green_table)
        (inReceptacle silver_knife green_table)
        (inReceptacle green_bottle green_table)
        (inReceptacle clear_bottle green_table)
        (inReceptacle red_apple green_table)
        (not (holdsAny robot))
        (not (atLocation robot metal_pan))
        (not (atLocation robot kitchen_sink))
        (not (atLocation robot green_table))
    )
    (:goal
        (and
            (inReceptacle metal_pan green_table)
            (isClean metal_pan)
        )
    )
)