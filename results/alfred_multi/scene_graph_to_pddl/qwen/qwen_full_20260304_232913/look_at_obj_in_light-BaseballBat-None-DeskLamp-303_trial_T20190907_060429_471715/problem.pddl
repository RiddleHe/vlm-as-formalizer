(define (problem turn_on_lamp_to_examine_bat)
    (:domain put_task)
    (:objects
        robot - agent
        baseball_bat - object
        lamp - object
        wooden_table - receptacle
        nightstand - receptacle
        bed - receptacle
        book - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable nightstand)
        (inReceptacle book bed)
        (inReceptacle lamp wooden_table)
        (inReceptacle baseball_bat wooden_table)
        (not (isOn lamp))
        (not (isToggled lamp))
        (not (atLocation robot wooden_table))
        (not (atLocation robot nightstand))
        (not (atLocation robot bed))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (isOn lamp)
            (isToggled lamp)
        )
    )
)