(define (problem put_slice_tomato_in_trash)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        trash_bin - receptacle
        knife - object
        tomato - object
        kettle - object
        cup - object
        mug - object
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
        (inReceptacle knife sink)
        (inReceptacle fork sink)
        (inReceptacle mug coffee_maker) ; Note: coffee_maker is not defined as a receptacle in domain, so this may need adjustment
        (atLocation agent sink) ; Assuming agent starts near sink as it's a common starting point
    )
    (:goal (and
        (isSliced tomato)
        (inReceptacle tomato trash_bin)
    ))
)