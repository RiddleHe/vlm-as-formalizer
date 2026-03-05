(define (problem put_washed_slice_of_potato_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        potato - object
        fork - object
        spoon - object
        spatula - object
        metal_cup - object
        bowl - object
        kettle - object
        apple - object
        black_mug - object
        salt_shaker - object
        egg - object
        wooden_cabinet - receptacle
        white_table - receptacle
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable wooden_cabinet)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle egg microwave)
        (inReceptacle apple sink)
        (inReceptacle fork sink)
        (inReceptacle black_mug sink)
        (atLocation robot microwave)
    )
    (:goal
        (and
            (inReceptacle potato microwave)
            (isClean potato)
            (isSliced potato)
        )
    )
)