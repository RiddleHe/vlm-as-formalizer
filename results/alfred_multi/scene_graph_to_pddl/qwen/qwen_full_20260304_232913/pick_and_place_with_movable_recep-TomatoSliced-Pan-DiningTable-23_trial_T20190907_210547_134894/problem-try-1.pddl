(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave fridge sink - receptacle
        knife_on_table knife_on_stove - knife
        tomato_on_table tomato_sliced lettuce_on_table bottle_wine bottle_oil salt_shaker pepper_shaker egg wine_glass bowl_on_table pan_on_stove pot_on_stove island_table shelf_under_table - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable bowl_on_table)
        (openable pan_on_stove)
        (openable pot_on_stove)
        (openable island_table)
        (openable shelf_under_table)
        (opened bowl_on_table)
        (opened pan_on_stove)
        (opened pot_on_stove)
        (opened island_table)
        (opened shelf_under_table)
        (isOn pan_on_stove)
        (isOn pot_on_stove)
        (inReceptacle tomato_on_table island_table)
        (inReceptacle knife_on_table island_table)
        (inReceptacle bowl_on_table island_table)
        (inReceptacle pan_on_stove stove)
        (inReceptacle pot_on_stove stove)
    )
    (:goal (and
        (inReceptacle tomato_sliced pan_on_stove)
        (inReceptacle pan_on_stove island_table)
    ))
)