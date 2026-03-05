(define (problem cool_egg_and_put_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        egg - object
        bowl - object
        apple - object
        bread - object
        plate - object
        ladle - object
        bottle - object
        fork - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (atLocation robot microwave)
        (not (opened microwave))
        (not (opened fridge))
        (not (holdsAny robot))
        (not (isCool egg))
        (not (isHot egg))
        (not (isClean egg))
        (not (isSliced egg))
        (not (isOn microwave))
        (not (isToggled microwave))
    )
    (:goal
        (and
            (inReceptacle egg microwave)
            (isCool egg)
        )
    )
)