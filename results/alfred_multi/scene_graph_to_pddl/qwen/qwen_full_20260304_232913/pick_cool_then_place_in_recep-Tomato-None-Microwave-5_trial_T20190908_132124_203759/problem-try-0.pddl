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
        stove
        cabinet_left
        cabinet_right
        tomato
        cup
        pot
        spatula
        dog_statue
        counter
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable cabinet_left)
        (openable cabinet_right)
        (opened cabinet_left)
        (opened cabinet_right)
        (isOn toaster)
        (isOn stove)
        (isToggled toaster)
        (isToggled stove)
        (inReceptacle pot stove)
        (inReceptacle cup counter)
        (inReceptacle knife_in_cabinet cabinet_left)
        (inReceptacle dog_statue counter)
        (atLocation agent counter)
    )
    (:goal (and
        (inReceptacle tomato microwave)
        (isCool tomato)
    ))
)