(define (problem put_heated_potato_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        black_microwave - microwave
        black_fridge - fridge
        sink - sink
        knife - knife
        potato - object
        red_apple - object
        green_book - object
        loaf_of_bread - object
        plate - object
        black_coffee_maker - object
        black_mug - object
        bottle - object
        fork - object
        round_wooden_table - receptacle
    )
    (:init
        (openable black_fridge)
        (openable black_microwave)
        (openable sink)
        (opened black_fridge)
        (isOn black_microwave)
        (isOn black_coffee_maker)
        (isToggled black_microwave)
        (isToggled black_coffee_maker)
        (inReceptacle black_mug black_coffee_maker)
        (atLocation robot black_microwave)
    )
    (:goal (and
        (inReceptacle potato black_fridge)
        (isHot potato)
    ))
)