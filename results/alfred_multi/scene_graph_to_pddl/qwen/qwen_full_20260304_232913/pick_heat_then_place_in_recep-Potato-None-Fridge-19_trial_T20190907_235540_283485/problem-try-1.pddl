(define (problem put_heated_potato_in_fridge)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        potato - object
        apple - object
        bread - object
        book - object
        plate - object
        coffee_maker - object
        mug - object
        bottle - object
        fork - object
        table - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (isOn microwave)
        (isOn coffee_maker)
        (inReceptacle mug coffee_maker)
        (atLocation agent table)
        (atLocation potato table)
        (atLocation apple table)
        (atLocation bread table)
        (atLocation book table)
        (atLocation plate table)
        (atLocation knife table)
        (atLocation bottle table)
        (atLocation fork countertop)
        (atLocation microwave countertop)
        (atLocation fridge wall)
        (atLocation sink countertop)
    )
    (:goal (and
        (inReceptacle potato fridge)
        (isHot potato)
        (isCool potato)
    ))
)