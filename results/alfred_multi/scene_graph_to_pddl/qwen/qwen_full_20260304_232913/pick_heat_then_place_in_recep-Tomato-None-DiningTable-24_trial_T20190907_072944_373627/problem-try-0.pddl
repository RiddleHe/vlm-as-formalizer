(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife_on_table - knife
        knife_on_counter - knife
        golden_trash_can - receptacle
        black_plate - receptacle
        green_book - receptacle
        brown_cabinet - receptacle
        red_tomato - object
        yellow_apple - object
        silver_fork - object
        salt_shaker - object
        lettuce - object
        black_stool - object
        silver_knife - object
        silver_spoon - object
        copper_mug - object
        soap_dispenser - object
        table - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (inReceptacle red_tomato black_plate)
        (inReceptacle yellow_apple brown_cabinet)
        (inReceptacle silver_fork black_plate)
        (inReceptacle salt_shaker brown_cabinet)
        (inReceptacle lettuce table)
        (inReceptacle green_book table)
        (inReceptacle silver_knife table)
        (inReceptacle silver_spoon table)
        (inReceptacle copper_mug table)
        (inReceptacle soap_dispenser table)
        (atLocation robot black_plate)
    )
    (:goal (and
        (inReceptacle red_tomato table)
        (isHot red_tomato)
    ))
)