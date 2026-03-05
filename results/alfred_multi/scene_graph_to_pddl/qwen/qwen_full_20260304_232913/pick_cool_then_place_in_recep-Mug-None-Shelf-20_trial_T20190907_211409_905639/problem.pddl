(define (problem chill_mug_and_set_on_rack)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge_with_digital_display - fridge
        wooden_shelf_rack - receptacle
        white_mug - object
        silver_knife - knife
        silver_toaster - object
        black_coffee_maker - object
        sink - sink
        microwave - microwave
    )
    (:init
        (openable black_fridge_with_digital_display)
        (not (opened black_fridge_with_digital_display))
        (inReceptacle white_mug black_coffee_maker)
        (isOn silver_toaster)
        (isOn black_coffee_maker)
        (isToggled silver_toaster)
        (isToggled black_coffee_maker)
        (atLocation robot black_coffee_maker)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle white_mug wooden_shelf_rack)
        (isCool white_mug)
    ))
)