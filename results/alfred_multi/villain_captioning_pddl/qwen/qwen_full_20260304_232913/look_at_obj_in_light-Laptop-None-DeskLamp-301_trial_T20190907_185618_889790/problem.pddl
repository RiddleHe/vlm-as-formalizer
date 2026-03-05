(define (problem carry_laptop_turn_on_light)
    (:domain put_task)
    (:objects
        agent1 - agent
        laptop_left - object
        laptop_right - object
        book - object
        smartphone - object
        pillow - object
        lamp - object
        alarm_clock - object
        nightstand - receptacle
        bed - receptacle
    )
    (:init
        (atLocation agent1 nightstand) ; Assuming agent starts near nightstand for efficiency; if unspecified, could be anywhere, but must go to an object first.
        (inReceptacle laptop_left bed)
        (inReceptacle laptop_right bed)
        (inReceptacle book bed)
        (inReceptacle smartphone bed)
        (inReceptacle pillow bed)
        (inReceptacle lamp nightstand)
        (inReceptacle alarm_clock nightstand)
        (openable nightstand)
        (not (opened nightstand))
        (not (isOn lamp))
        (not (isToggled lamp))
        (not (holdsAny agent1))
    )
    (:goal (and
        (holds agent1 laptop_left) ; or laptop_right, either is acceptable per instruction
        (isOn lamp)
        (isToggled lamp)
    ))
)