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
        wine_glass - object
        coffee_maker - object
    )
    (:init
        (openable cabinet_under_sink)
        (openable cabinet_above_sink)
        (inReceptacle mug coffee_maker)
        (inReceptacle bread cabinet_under_sink)
        (inReceptacle fork cabinet_under_sink)
        (inReceptacle salt_shaker cabinet_under_sink)
        (inReceptacle pepper_shaker cabinet_under_sink)
        (inReceptacle wine_glass sink)
        (not (holdsAny robot))
        (not (atLocation robot mug))
        (not (atLocation robot coffee_maker))
        (not (atLocation robot microwave))
        (not (atLocation robot cabinet_above_sink))
        (not (isHot mug))
        (not (isSliced mug))
        (not (isClean mug))
        (not (isCool mug))
        (not (isOn coffee_maker))
        (not (isToggled coffee_maker))
    )
    (:goal (and
        (inReceptacle mug cabinet_above_sink)
        (isHot mug)
    ))
)