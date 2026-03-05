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
        (inReceptacle bread sink)
        (inReceptacle fork sink)
        (inReceptacle knife sink)
        (inReceptacle mug sink)
        (atLocation agent sink) ; assuming agent starts near sink as per scene
    )
    (:goal (and
        (inReceptacle tomato trash_bin)
        (isSliced tomato)
    ))
)