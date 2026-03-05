(define (problem put_heated_plate_in_fridge)
    (:domain put_task)
    (:objects
        agent
        grey_microwave_with_red_handle - microwave
        grey_plate - object
        wooden_cabinet_door_with_gold_knob - receptacle
        wooden_cabinet_door_with_gold_knob_right - receptacle
        wooden_cabinet_above_microwave_left - receptacle
        wooden_cabinet_above_microwave_right - receptacle
        black_pot - object
        silver_kettle - object
        black_faucet - object
    )
    (:init
        (openable grey_microwave_with_red_handle)
        (openable wooden_cabinet_door_with_gold_knob)
        (openable wooden_cabinet_door_with_gold_knob_right)
        (openable wooden_cabinet_above_microwave_left)
        (openable wooden_cabinet_above_microwave_right)
        (isOn grey_microwave_with_red_handle)
        (isToggled grey_microwave_with_red_handle)
    )
    (:goal
        (and
            (inReceptacle grey_plate fridge)
            (isHot grey_plate)
        )
    )
)