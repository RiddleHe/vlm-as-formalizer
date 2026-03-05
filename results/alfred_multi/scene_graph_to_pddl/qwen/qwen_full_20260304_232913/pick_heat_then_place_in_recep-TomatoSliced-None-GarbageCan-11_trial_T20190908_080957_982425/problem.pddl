(define (problem put_slice_tomato_in_trash)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        trash_bin - receptacle
        knife - object
        kettle - object
        tomato - object
        cup - object
        mug - object
        toaster - object
        bread - object
        fork - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable trash_bin)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (opened trash_bin)
        (isOn toaster)
        (isOn mug)
        (isToggled toaster)
        (isToggled mug)
        (inReceptacle knife sink)
        (inReceptacle fork sink)
        (atLocation agent sink) ; assuming agent starts near sink as it's a common starting point
    )
    (:goal (and
        (inReceptacle tomato trash_bin)
        (isSliced tomato)
    ))
)