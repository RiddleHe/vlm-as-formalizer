(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        silver_bowl_stove - receptacle
        silver_bowl_dining_table - receptacle
        brown_pan_dining_table - receptacle
        white_cup_under_dining_table - receptacle
        white_cup_dining_table - receptacle
        silver_bowl_countertop - receptacle
        green_cabbage_countertop - object
        green_cabbage_dining_table - object
        egg - object
        spoon - object
        red_coffee_maker - object
        salt_shaker - object
        pepper_shaker - object
        soap_dispenser - object
        trash_can - object
        kitchen_island_counter - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (isOn microwave)
        (isOn stove)
        (isOn coffee maker)
        (isToggled microwave)
        (isToggled coffee maker)
        (inReceptacle egg sink)
        (inReceptacle spoon sink)
        (inReceptacle silver_bowl_stove stove)
        (inReceptacle silver_bowl_countertop countertop)
        (inReceptacle white_cup_dining_table dining_table)
        (inReceptacle white_cup_under_dining_table under_dining_table)
        (atLocation robot kitchen_island_counter)
    )
    (:goal (and
        (inReceptacle white_cup_dining_table kitchen_island_counter)
        (inReceptacle fork white_cup_dining_table)
    ))
)