(define (problem wash_knife_and_return_to_shelf)
    (:domain put_task)
    (:objects
        agent
        sink - receptacle
        cabinet - receptacle
        black_table - receptacle
        knife_on_black_table - object
        knife_in_sink - object
        apple_on_black_table - object
        apple_in_sink - object
        red_apple_in_sink - object
        fork_on_black_table - object
        spoon_on_black_table - object
        salt_shaker_on_black_table - object
        glass_on_black_table - object
        black_trash_bag - object
        soap_dispenser_on_cabinet - object
    )
    (:init
        (openable sink)
        (openable cabinet)
        (inReceptacle knife_on_black_table black_table)
        (inReceptacle apple_on_black_table black_table)
        (inReceptacle fork_on_black_table black_table)
        (inReceptacle spoon_on_black_table black_table)
        (inReceptacle salt_shaker_on_black_table black_table)
        (inReceptacle glass_on_black_table black_table)
        (inReceptacle black_trash_bag black_table)
        (inReceptacle soap_dispenser_on_cabinet cabinet)
        (inReceptacle knife_in_sink sink)
        (inReceptacle apple_in_sink sink)
        (inReceptacle red_apple_in_sink sink)
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle knife_on_black_table black_table)
        (isClean knife_on_black_table)
    ))
)