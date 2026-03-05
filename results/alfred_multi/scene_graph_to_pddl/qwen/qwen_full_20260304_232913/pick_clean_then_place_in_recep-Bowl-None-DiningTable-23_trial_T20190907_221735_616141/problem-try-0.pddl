(define (problem fill_pan_with_water_and_place_on_island)
    (:domain put_task)
    (:objects
        agent
        black_fridge - fridge
        kitchen_sink - sink
        metal_pan - receptacle
        square_bowl1 - receptacle
        square_bowl2 - receptacle
        glass_bottle - receptacle
        wine_bottle1 - receptacle
        wine_bottle2 - receptacle
        knife_on_table - knife
        knife_near_pan - knife
        fork - object
        apple - object
        green_cup - object
        table - object
    )
    (:init
        (openable black_fridge)
        (openable kitchen_sink)
        (not (opened black_fridge))
        (not (opened kitchen_sink))
        (inReceptacle metal_pan table)
        (inReceptacle square_bowl1 table)
        (inReceptacle square_bowl2 table)
        (inReceptacle glass_bottle table)
        (inReceptacle wine_bottle1 table)
        (inReceptacle wine_bottle2 table)
        (inReceptacle knife_on_table table)
        (inReceptacle knife_near_pan table)
        (inReceptacle fork table)
        (inReceptacle apple table)
        (inReceptacle green_cup table)
        (not (holdsAny agent))
        (not (atLocation agent table))
        (not (isClean metal_pan))
        (not (isHot metal_pan))
        (not (isCool metal_pan))
        (not (isOn metal_pan))
        (not (isToggled metal_pan))
        (not (isSliced metal_pan))
    )
    (:goal
        (and
            (inReceptacle metal_pan table)
            (isClean metal_pan)
        )
    )
)