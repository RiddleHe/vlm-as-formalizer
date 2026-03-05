(define (problem put_chilled_tomato_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        black_microwave - microwave
        black_fridge - fridge
        silver_toaster - receptacle
        oven - receptacle
        cabinet - receptacle
        gray_dog_figurine - object
        silver_cup - object
        copper_pot - object
        silver_pot - object
        spatula - object
        knife - knife
    )
    (:init
        (openable black_microwave)
        (openable black_fridge)
        (openable silver_toaster)
        (openable oven)
        (openable cabinet)
        (opened cabinet)
        (isOn silver_toaster)
        (isOn oven)
        (isToggled silver_toaster)
        (isToggled oven)
        (inReceptacle gray_dog_figurine silver_toaster)
        (inReceptacle silver_cup silver_toaster)
        (inReceptacle copper_pot oven)
        (inReceptacle silver_pot oven)
        (atLocation robot cabinet)
    )
    (:goal (and
        (inReceptacle tomato black_microwave)
        (isCool tomato)
    ))
)