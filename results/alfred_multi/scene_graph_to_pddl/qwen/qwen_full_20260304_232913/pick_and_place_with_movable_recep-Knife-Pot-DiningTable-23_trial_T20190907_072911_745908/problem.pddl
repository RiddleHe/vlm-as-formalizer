(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        dining_table - receptacle
        shelf_under_table - receptacle
        pan_on_table - receptacle
        metal_bowl_on_stove - receptacle
        metal_bowl_on_stove_2 - receptacle
        trash_can - receptacle
        knife_on_table - knife
        knife_on_table_2 - knife
        green_squash_1 - object
        green_squash_2 - object
        wine_bottle - object
        egg - object
        salt_shaker - object
        pepper_shaker - object
        green_book - object
        spoon - object
        spatula - object
        metal_cup - object
        brown_tray - object
        metal_bowl_stack - object
        wooden_chair_1 - object
        wooden_chair_2 - object
    )
    (:init
        (openable shelf_under_table)
        (openable trash_can)
        (inReceptacle metal_cup shelf_under_table)
        (inReceptacle brown_tray pan_on_table)
        (inReceptacle metal_bowl_stack dining_table)
        (inReceptacle green_book dining_table)
        (inReceptacle salt_shaker dining_table)
        (inReceptacle pepper_shaker dining_table)
        (inReceptacle egg dining_table)
        (inReceptacle wine_bottle dining_table)
        (inReceptacle green_squash_1 dining_table)
        (inReceptacle green_squash_2 dining_table)
        (inReceptacle knife_on_table dining_table)
        (inReceptacle knife_on_table_2 dining_table)
        (inReceptacle spoon dining_table)
        (inReceptacle spatula dining_table)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle knife_on_table pan_on_table)
        (inReceptacle pan_on_table dining_table)
    ))
)