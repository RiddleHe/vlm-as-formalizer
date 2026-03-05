(define (problem put_salt_shaker_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        drawer - receptacle
        cabinets - receptacle
        knife - knife
        spoon - object
        pot - object
        apple - object
        toaster - object
        stove - object
        kettle1 - object
        kettle2 - object
        frying_pan - object
        egg - object
        fork - object
    )
    (:init
        (openable microwave)
        (openable sink)
        (openable drawer)
        (openable cabinets)
        (not (opened microwave))
        (not (opened sink))
        (not (opened drawer))
        (not (opened cabinets))
        (not (holdsAny robot))
        (isOn toaster)
        (isOn stove)
        (isOn kettle1)
        (isOn kettle2)
        (inReceptacle spoon sink)
        (inReceptacle pot sink)
        (inReceptacle apple sink)
        (atLocation robot microwave) ; arbitrary starting location, since robot is not at any object initially, we pick one for initialization
    )
    (:goal (and
        (inReceptacle salt_shaker drawer)
    ))
)