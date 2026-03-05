(define (problem warm_mug_and_put_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        cabinet_under_sink - receptacle
        cabinet_above_sink - receptacle
        mug - object
        bread - object
        fork - object
        salt_shaker - object
        pepper_shaker - object
        green_apple - object
        coffee_machine - object
    )
    (:init
        (openable cabinet_under_sink)
        (openable cabinet_above_sink)
        (inReceptacle mug coffee_machine)
        (inReceptacle bread cabinet_under_sink)
        (inReceptacle fork cabinet_under_sink)
        (inReceptacle salt_shaker cabinet_under_sink)
        (inReceptacle pepper_shaker cabinet_under_sink)
        (inReceptacle green_apple cabinet_under_sink)
        (inReceptacle knife cabinet_under_sink)
        (not (atLocation robot mug))
        (not (atLocation robot cabinet_above_sink))
        (not (holdsAny robot))
        (not (isHot mug))
        (not (opened cabinet_above_sink))
    )
    (:goal (and
        (inReceptacle mug cabinet_above_sink)
        (isHot mug)
    ))
)