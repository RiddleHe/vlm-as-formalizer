(define (problem wash_knife_and_return_to_shelf)
    (:domain put_task)
    (:objects
        robot - agent
        kitchen_sink - sink
        black_table - receptacle
        grey_cabinet - receptacle
        silver_knife_on_table - knife
        yellow_apple_on_table - object
        silver_fork_on_table - object
        silver_spoon_on_table - object
        salt_shaker_on_table - object
        silver_cup_on_cabinet - object
        silver_spoon_on_cabinet - object
        brown_pump_bottle_on_cabinet - object
        red_apple_in_sink - object
        yellow_apple_in_sink - object
        silver_knife_in_sink - object
    )
    (:init
        (openable grey_cabinet)
        (inReceptacle yellow_apple_on_table black_table)
        (inReceptacle silver_fork_on_table black_table)
        (inReceptacle silver_spoon_on_table black_table)
        (inReceptacle salt_shaker_on_table black_table)
        (inReceptacle silver_knife_on_table black_table)
        (inReceptacle silver_cup_on_cabinet grey_cabinet)
        (inReceptacle silver_spoon_on_cabinet grey_cabinet)
        (inReceptacle brown_pump_bottle_on_cabinet grey_cabinet)
        (inReceptacle red_apple_in_sink kitchen_sink)
        (inReceptacle yellow_apple_in_sink kitchen_sink)
        (inReceptacle silver_knife_in_sink kitchen_sink)
    )
    (:goal (and
        (inReceptacle silver_knife_on_table black_table)
        (isClean silver_knife_on_table)
    ))
)