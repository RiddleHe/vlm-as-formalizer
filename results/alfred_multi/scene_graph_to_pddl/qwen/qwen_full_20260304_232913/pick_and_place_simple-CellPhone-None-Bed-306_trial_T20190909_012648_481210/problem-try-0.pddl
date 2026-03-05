(define (problem put_phone_on_bed)
    (:domain put_task)
    (:objects
        agent
        phone
        blue_pen
        lamp
        chair
        trash_can
        wooden_desk
        bed
        microwave
        fridge
        sink
        knife
    )
    (:init
        (atLocation agent wooden_desk)  ; assuming agent starts near desk for accessibility
        (inReceptacle phone wooden_desk)
        (inReceptacle blue_pen wooden_desk)
        (isOn lamp)
        (isToggled lamp)
        (openable trash_can)
        (not (opened trash_can))
        (not (holdsAny agent))
        (not (holds agent phone))
        (not (inReceptacle phone bed))
    )
    (:goal (and
        (inReceptacle phone bed)
    ))
)