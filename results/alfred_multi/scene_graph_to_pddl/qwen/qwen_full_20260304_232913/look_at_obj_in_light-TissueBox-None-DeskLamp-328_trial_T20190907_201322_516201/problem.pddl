(define (problem turn_on_lamp_pick_up_tissues)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_desk - receptacle
        tissue_box - receptacle
        lamp_base - receptacle
        lamp_shade - object
        pencil - object
        black_chair - object
        digital_clock - object
        keys - object
        dumbbell - object
        tissue_paper - object
        green_lamp - object
    )
    (:init
        (openable tissue_box)
        (not (opened tissue_box))
        (inReceptacle tissue_paper tissue_box)
        (not (holdsAny robot))
        (not (isOn green_lamp))
        (not (isToggled green_lamp))
        (atLocation robot wooden_desk) ; assuming robot starts near desk for accessibility
    )
    (:goal (and
        (isOn green_lamp)
        (holds robot tissue_box)
    ))
)