(define (problem put_hot_glass_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        cabinet - receptacle
        glass - object
        potato - object
        spoon - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable cabinet)
        (inReceptacle glass sink)
        (inReceptacle potato sink)
        (inReceptacle spoon sink)
        (not (holdsAny robot))
        (not (isHot glass))
        (not (isClean glass))
        (not (isCool glass))
        (not (isSliced glass))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (atLocation robot sink))
        (not (atLocation robot microwave))
        (not (atLocation robot cabinet))
    )
    (:goal
        (and
            (inReceptacle glass cabinet)
            (isHot glass)
        )
    )
)