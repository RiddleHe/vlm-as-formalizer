(define (problem cook_and_refrigerate_potato_slice)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        potato - object
        black_pot - object
        blue_cast_iron_pan - object
        brown_container - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (opened microwave)
        (inReceptacle potato microwave)
        (isOn blue_cast_iron_pan)
        (isToggled blue_cast_iron_pan)
        (atLocation robot microwave)
    )
    (:goal (and
        (inReceptacle potato fridge)
        (isSliced potato)
        (isHot potato)
    ))
)