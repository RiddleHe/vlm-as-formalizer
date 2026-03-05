(define (problem put_pen_in_bowl)
    (:domain put_task)
    (:objects
        agent
        wooden_desk
        wooden_cabinet
        metal_bowl_left
        metal_bowl_right
        pen
        cd
        laptop
        chair
        lamp
        alarm_clock
        basketball
        boots
        microwave
        fridge
        sink
        knife
    )
    (:init
        (openable wooden_cabinet)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle cd wooden_cabinet)
        (inReceptacle metal_bowl_left wooden_cabinet)
        (inReceptacle metal_bowl_right wooden_cabinet)
        (atLocation agent wooden_desk)  ; Assuming agent starts near desk for initial interaction
    )
    (:goal
        (and
            (inReceptacle pen metal_bowl_left)
            (atLocation agent wooden_desk)
        )
    )
)