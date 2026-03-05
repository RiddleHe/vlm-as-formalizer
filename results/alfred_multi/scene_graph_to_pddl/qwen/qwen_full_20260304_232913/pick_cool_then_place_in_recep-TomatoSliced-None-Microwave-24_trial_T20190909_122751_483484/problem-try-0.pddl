(define (problem put_cold_tomato_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        tomato - object
        fork - object
        spoon - object
        wine_glass - object
        soap_dispenser - object
        toaster - object
        salt_shaker - object
        pan - object
        trash_can - object
        countertop_near_sink - object
        countertop_near_stove - object
        wooden_cabinet_under_sink - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato microwave)
        (inReceptacle fork sink)
        (inReceptacle spoon sink)
        (inReceptacle wine_glass countertop_near_stove)
        (inReceptacle soap_dispenser countertop_near_sink)
        (inReceptacle toaster countertop_near_sink)
        (inReceptacle salt_shaker countertop_near_sink)
        (inReceptacle pan countertop_near_stove)
        (atLocation robot microwave)  ; robot starts at microwave as per scene context
    )
    (:goal (and
        (inReceptacle tomato microwave)
        (isCool tomato)
    ))
)