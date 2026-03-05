(define (problem put_pen_in_bowl)
    (:domain put_task)
    (:objects
        robot - agent
        pen - object
        cd - object
        laptop - object
        lamp - object
        basketball - object
        boots - object
        metal_bowl_left - receptacle
        metal_bowl_right - receptacle
        wooden_desk - receptacle
        wooden_cabinet - receptacle
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable metal_bowl_left)
        (openable metal_bowl_right)
        (openable wooden_cabinet)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle cd wooden_cabinet)
        (inReceptacle metal_bowl_left wooden_cabinet)
        (inReceptacle metal_bowl_right wooden_cabinet)
        (atLocation robot wooden_desk)
    )
    (:goal (and
        (inReceptacle pen metal_bowl_left)
        (atLocation robot wooden_desk)
    ))
)