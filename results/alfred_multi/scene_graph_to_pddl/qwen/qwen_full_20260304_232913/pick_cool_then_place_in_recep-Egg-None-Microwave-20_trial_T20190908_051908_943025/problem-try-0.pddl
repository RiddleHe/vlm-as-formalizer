(define (problem cool_egg_and_put_in_microwave)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        egg - object
        apple - object
        bread - object
        bowl - object
        plate - object
        ladle - object
        soap_dispenser - object
        salt_shaker - object
        chair - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (inReceptacle egg sink)
        (inReceptacle apple sink)
        (inReceptacle bread sink)
        (inReceptacle bowl sink)
        (inReceptacle plate sink)
        (inReceptacle ladle sink)
        (inReceptacle soap_dispenser sink)
        (inReceptacle salt_shaker sink)
        (not (holdsAny agent))
        (not (atLocation agent microwave))
        (not (atLocation agent fridge))
        (not (atLocation agent sink))
        (not (isCool egg))
        (not (isHot egg))
        (not (isSliced egg))
        (not (isClean egg))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (opened fridge))
        (not (opened microwave))
    )
    (:goal
        (and
            (inReceptacle egg microwave)
            (isCool egg)
        )
    )
)