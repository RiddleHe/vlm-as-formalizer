(define (problem put_hot_glass_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        microwave - microwave
        cabinet_left cabinet_right - receptacle
        glass bottle egg - object
        knife - knife
    )
    (:init
        (openable sink)
        (openable microwave)
        (openable cabinet_left)
        (openable cabinet_right)
        (not (opened sink))
        (not (opened microwave))
        (not (opened cabinet_left))
        (not (opened cabinet_right))
        (inReceptacle glass sink)
        (inReceptacle bottle sink)
        (inReceptacle egg sink)
        (not (holdsAny robot))
        (not (isClean glass))
        (not (isHot glass))
        (not (isCool glass))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (isSliced glass))
        (not (atLocation robot sink))
        (not (atLocation robot microwave))
        (not (atLocation robot cabinet_left))
        (not (atLocation robot cabinet_right))
    )
    (:goal (and
        (inReceptacle glass cabinet_left)
        (isHot glass)
    ))
)