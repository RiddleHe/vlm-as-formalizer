(define (problem heat_egg_and_trash)
    (:domain put_task)
    (:objects
        robot - agent
        silver_microwave_with_green_apple_inside - microwave
        stainless_steel_dishwasher - fridge
        white_sink_with_black_pot_inside - sink
        black_trash_can_under_counter - receptacle
        brown_egg - object
        green_apple_in_microwave - object
        black_pot_on_stove - object
        silver_kettle - object
        pink_oil_bottle - object
        black_toaster - object
        silver_salt_shaker - object
        black_pot_in_sink - object
    )
    (:init
        (openable silver_microwave_with_green_apple_inside)
        (openable stainless_steel_dishwasher)
        (openable white_sink_with_black_pot_inside)
        (openable black_trash_can_under_counter)
        (opened silver_microwave_with_green_apple_inside)
        (opened white_sink_with_black_pot_inside)
        (opened black_trash_can_under_counter)
        (inReceptacle green_apple_in_microwave silver_microwave_with_green_apple_inside)
        (inReceptacle black_pot_in_sink white_sink_with_black_pot_inside)
        (inReceptacle brown_egg black_trash_can_under_counter)
        (isOn black_pot_on_stove)
        (isOn black_toaster)
        (isOn silver_microwave_with_green_apple_inside)
        (not (holdsAny robot))
    )
    (:goal (and
        (isHot brown_egg)
        (inReceptacle brown_egg black_trash_can_under_counter)
    ))
)