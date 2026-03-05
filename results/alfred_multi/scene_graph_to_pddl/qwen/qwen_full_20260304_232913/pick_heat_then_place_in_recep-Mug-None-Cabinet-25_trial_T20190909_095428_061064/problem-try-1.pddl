(define (problem warm_mug_and_put_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        wooden_cabinet_under_sink - receptacle
        wooden_cabinet_above_sink - receptacle
        white_mug - object
        loaf_of_bread - object
        fork - object
        salt_shaker - object
        pepper_shaker - object
        wine_glass - object
        coffee_machine - object
    )
    (:init
        (openable wooden_cabinet_under_sink)
        (openable wooden_cabinet_above_sink)
        (isOn coffee_machine)
        (inReceptacle white_mug coffee_machine)
        (inReceptacle loaf_of_bread wooden_cabinet_under_sink)
        (inReceptacle fork wooden_cabinet_under_sink)
        (inReceptacle salt_shaker wooden_cabinet_under_sink)
        (inReceptacle pepper_shaker wooden_cabinet_under_sink)
        (inReceptacle wine_glass window_sill) ; Note: window_sill is not defined as a receptacle, so this may need adjustment. But per scene graph, it's included.
        (not (holdsAny robot))
        (not (atLocation robot white_mug))
        (not (atLocation robot coffee_machine))
        (not (atLocation robot wooden_cabinet_under_sink))
        (not (atLocation robot wooden_cabinet_above_sink))
        (not (isHot white_mug))
        (not (isClean white_mug))
        (not (isCool white_mug))
        (not (isSliced white_mug))
        (not (isToggled white_mug))
        (not (opened wooden_cabinet_under_sink))
        (not (opened wooden_cabinet_above_sink))
    )
    (:goal (and
        (inReceptacle white_mug wooden_cabinet_above_sink)
        (isHot white_mug)
    ))
)