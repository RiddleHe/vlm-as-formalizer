(define (problem put_salt_shaker_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        drawer_left - receptacle
        drawer_right - receptacle
        toaster_oven - receptacle
        stove - receptacle
        knife - knife
        frying_pan - object
        egg - object
        toaster - object
        fork - object
        spoon - object
        apple - object
        pot - object
        kettle1 - object
        kettle2 - object
        salt_shaker - object  ; assumed to exist as per instruction, though not in scene graph
    )
    (:init
        (openable drawer_left)
        (openable drawer_right)
        (openable sink)
        (openable toaster_oven)
        (openable stove)
        (isOn stove)
        (isOn toaster_oven)
        (inReceptacle pot sink)
        (inReceptacle spoon sink)
        (inReceptacle apple sink)
        ; robot starts at no location
        (not (atLocation robot drawer_left))
        (not (atLocation robot drawer_right))
        (not (atLocation robot sink))
        (not (atLocation robot microwave))
        (not (atLocation robot toaster_oven))
        (not (atLocation robot stove))
        (not (holdsAny robot))
    )
    (:goal
        (inReceptacle salt_shaker drawer_left)
    )
)