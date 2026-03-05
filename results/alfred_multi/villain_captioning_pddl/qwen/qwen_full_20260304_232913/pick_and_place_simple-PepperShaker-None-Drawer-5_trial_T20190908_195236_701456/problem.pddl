(define (problem put_salt_shaker_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        drawer1 drawer2 drawer3 - receptacle
        knife - knife
        pan - object
        egg - object
        toaster - object
        kettle1 kettle2 - object
        stove - object
        fork1 fork2 - object
        spoon1 spoon2 - object
        apple - object
        pot - object
    )
    (:init
        (openable microwave)
        (openable drawer1)
        (openable drawer2)
        (openable drawer3)
        (not (opened microwave))
        (not (opened drawer1))
        (not (opened drawer2))
        (not (opened drawer3))
        (inReceptacle pot sink)
        (inReceptacle spoon1 sink)
        (inReceptacle apple sink)
        (inReceptacle pan stove)
        (atLocation robot microwave) ; arbitrary starting location
        (not (holdsAny robot))
        (not (isClean knife))
        (not (isHot knife))
        (not (isCool knife))
        (not (isOn knife))
        (not (isToggled knife))
        (not (isSliced knife))
    )
    (:goal (and
        (inReceptacle salt_shaker drawer1) ; This goal is unachievable as salt_shaker is not in the objects list
    ))
)