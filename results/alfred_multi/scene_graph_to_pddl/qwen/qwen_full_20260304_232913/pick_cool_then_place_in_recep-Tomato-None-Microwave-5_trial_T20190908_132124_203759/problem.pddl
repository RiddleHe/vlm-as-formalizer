(define (problem put_chilled_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_counter
        knife_in_cabinet
        toaster
        oven
        cabinet_left
        cabinet_right
        dog_statue
        spatula
        cup
        pot_on_stove
        pot_on_counter
        countertop
        floor
        wall
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (openable cabinet_left)
        (openable cabinet_right)
        (opened cabinet_left)
        (opened cabinet_right)
        (isOn toaster)
        (isOn oven)
        (isToggled toaster)
        (isToggled oven)
        (inReceptacle knife_in_cabinet cabinet_left)
        (inReceptacle pot_on_stove oven)
        (inReceptacle cup countertop)
        (inReceptacle dog_statue countertop)
        (inReceptacle spatula countertop)
    )
    (:goal (and
        (inReceptacle tomato microwave)
        (isCool tomato)
    ))
)