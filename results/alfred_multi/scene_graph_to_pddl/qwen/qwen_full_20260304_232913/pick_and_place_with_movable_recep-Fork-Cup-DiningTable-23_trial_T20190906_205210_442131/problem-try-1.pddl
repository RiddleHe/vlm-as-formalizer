(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge - fridge
        silver_sink - sink
        white_dishwasher - receptacle
        brown_cabinets - receptacle
        white_stove - receptacle
        dining_table - receptacle
        red_coffee_maker - object
        green_cabbage1 - object
        green_cabbage2 - object
        silver_pot1 - object
        silver_pot2 - object
        silver_spoon - object
        white_egg - object
        silver_funnel - object
        fork1 - object
        fork2 - object
        knife1 - knife
        knife2 - knife
        brown_pan - object
        white_cup - object
        brown_chairs - object
        wooden_floor - object
        green_countertop - object
    )
    (:init
        (openable black_fridge)
        (openable white_dishwasher)
        (openable brown_cabinets)
        (isOn white_stove)
        (isOn red_coffee_maker)
        (inReceptacle silver_spoon silver_sink)
        (inReceptacle white_egg silver_sink)
        (inReceptacle silver_funnel silver_sink)
        (inReceptacle white_cup dining_table)
        (atLocation robot black_fridge) ; initial location can be arbitrary as robot is not at any object initially, we pick one for grounding
    )
    (:goal
        (and
            (inReceptacle fork1 white_cup)
            (inReceptacle white_cup dining_table)
        )
    )
)