(define (problem put_phone_on_bed)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_dresser - receptacle
        bed - receptacle
        trash_can - receptacle
        phone - object
        pen - object
        lamp - object
        chair - object
        laptop - object
        blue_circular_object - object
        black_keyboard - object
        white_blanket - object
        brown_carpet - object
    )
    (:init
        (openable wooden_dresser)
        (openable trash_can)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle phone wooden_dresser)
        (inReceptacle pen wooden_dresser)
        (inReceptacle blue_circular_object laptop)
        (inReceptacle black_keyboard bed)
    )
    (:goal (and (inReceptacle phone bed)))
)