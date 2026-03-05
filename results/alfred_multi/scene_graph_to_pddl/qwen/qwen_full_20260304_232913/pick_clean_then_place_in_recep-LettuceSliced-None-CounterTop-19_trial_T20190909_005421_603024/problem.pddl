(define (problem put_washed_lettuce_slice)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge - fridge
        microwave - microwave
        kitchen_sink - sink
        counter_by_sink - receptacle
        table - receptacle
        knife_on_counter - knife
        knife_on_table - knife
        lettuce_on_table - object
        tomato_on_table - object
        egg_on_sink - object
        potato_on_sink - object
        bread_on_table - object
        coffee_maker_on_table - object
        salt_shaker_on_table - object
        soap_bottle_on_table - object
        egg_on_table - object
        potato_on_table - object
    )
    (:init
        (openable black_fridge)
        (openable microwave)
        (openable kitchen_sink)
        (opened black_fridge)
        (opened microwave)
        (opened kitchen_sink)
        (isOn coffee_maker_on_table)
        (isToggled coffee_maker_on_table)
        (inReceptacle egg_on_sink kitchen_sink)
        (inReceptacle potato_on_sink kitchen_sink)
        (inReceptacle lettuce_on_table table)
        (inReceptacle tomato_on_table table)
        (inReceptacle bread_on_table table)
        (inReceptacle coffee_maker_on_table table)
        (inReceptacle salt_shaker_on_table table)
        (inReceptacle soap_bottle_on_table table)
        (inReceptacle egg_on_table table)
        (inReceptacle potato_on_table table)
        (atLocation robot table) ; Assuming robot starts near table for accessibility
    )
    (:goal (and
        (inReceptacle lettuce_on_table counter_by_sink)
        (isClean lettuce_on_table)
        (isSliced lettuce_on_table)
    ))
)