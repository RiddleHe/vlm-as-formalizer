(define (problem put_heated_plate_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        grey_microwave_on_cabinet - microwave
        wooden_cabinet_left - receptacle
        wooden_cabinet_right - receptacle
        wooden_cabinet_above_microwave - receptacle
        grey_plate - object
        black_pot - object
        kettle - object
    )
    (:init
        (openable wooden_cabinet_left)
        (openable wooden_cabinet_right)
        (openable wooden_cabinet_above_microwave)
        (isOn grey_microwave_on_cabinet)
        (isToggled grey_microwave_on_cabinet)
        (inReceptacle grey_plate wooden_cabinet_left)
        (inReceptacle black_pot wooden_cabinet_right)
        (inReceptacle kettle wooden_cabinet_above_microwave)
    )
    (:goal
        (and
            (inReceptacle grey_plate fridge)
            (isHot grey_plate)
        )
    )
)