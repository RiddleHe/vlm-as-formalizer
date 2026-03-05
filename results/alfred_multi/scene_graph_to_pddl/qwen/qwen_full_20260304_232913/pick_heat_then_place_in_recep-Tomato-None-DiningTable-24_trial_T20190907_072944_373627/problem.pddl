(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife_on_table - knife
        knife_on_counter - knife
        golden_trash_can - receptacle
        wooden_cabinet - receptacle
        black_stool - receptacle
        red_tomato - object
        brown_bread - object
        yellow_apple - object
        salt_shaker - object
        fork_on_counter - object
        green_lettuce - object
        green_book - object
        copper_mug - object
        soap_dispenser - object
        black_coffee_maker - object
        black_plate - object
        white_plate - object
        red_tomato_in_microwave - object
        brown_bread_in_microwave - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (isHot red_tomato_in_microwave)
        (isHot brown_bread_in_microwave)
        (inReceptacle red_tomato_in_microwave microwave)
        (inReceptacle brown_bread_in_microwave microwave)
        (atLocation agent microwave)
    )
    (:goal (and
        (inReceptacle red_tomato_in_microwave black_stool)
        (isHot red_tomato_in_microwave)
    ))
)