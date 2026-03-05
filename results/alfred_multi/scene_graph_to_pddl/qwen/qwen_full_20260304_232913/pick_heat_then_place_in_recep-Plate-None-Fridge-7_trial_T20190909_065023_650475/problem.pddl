(define (problem put_heated_grey_plate_in_fridge)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave_on_cabinet - microwave
        fridge - fridge
        sink - sink
        knife - knife
        wooden_cabinet_left - receptacle
        wooden_cabinet_right - receptacle
        wooden_cabinet_above_microwave - receptacle
        grey_plate - object
        black_pot - object
        kettle - object
        faucet - object
    )
    (:init
        (openable microwave_on_cabinet)
        (openable fridge)
        (openable sink)
        (openable wooden_cabinet_left)
        (openable wooden_cabinet_right)
        (openable wooden_cabinet_above_microwave)
        (inReceptacle grey_plate wooden_cabinet_left)
        (inReceptacle black_pot sink)
        (inReceptacle kettle sink)
        (not (holdsAny agent1))
        (not (isHot grey_plate))
        (not (isCool grey_plate))
        (not (isClean grey_plate))
        (not (isSliced grey_plate))
        (not (isOn microwave_on_cabinet))
        (not (isToggled microwave_on_cabinet))
    )
    (:goal
        (and
            (inReceptacle grey_plate fridge)
            (isHot grey_plate)
        )
    )
)