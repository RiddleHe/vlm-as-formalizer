(define (problem cook_and_chill_bread_slice)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        knife - knife
        bread - object
        lettuce - object
        pepper_grinder - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (not (opened microwave))
        (not (opened fridge))
        (not (holdsAny robot))
        (not (isClean bread))
        (not (isHot bread))
        (not (isCool bread))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (isSliced bread))
        (atLocation robot bread)  ; assuming robot starts near bread for simplicity, as no initial location is specified
        (atLocation robot knife)
        (atLocation robot microwave)
        (atLocation robot fridge)
    )
    (:goal (and
        (isSliced bread)
        (isHot bread)
        (isCool bread)
    ))
)