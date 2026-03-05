(define (problem inspect_cd_by_lamp_light)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_desk - receptacle
        wooden_nightstand - receptacle
        cd - object
        lamp - object
        bowl - object
        red_card - object
        black_tablet_1 - object
        black_tablet_2 - object
        small_red_handled_knife - object
    )
    (:init
        (openable wooden_desk)
        (openable wooden_nightstand)
        (opened wooden_desk)
        (opened wooden_nightstand)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle cd wooden_desk)
        (inReceptacle bowl wooden_desk)
        (inReceptacle red_card wooden_desk)
        (inReceptacle black_tablet_1 wooden_desk)
        (inReceptacle black_tablet_2 wooden_desk)
        (inReceptacle small_red_handled_knife wooden_desk)
        (inReceptacle lamp wooden_nightstand)
        (not (holdsAny robot))
        (not (atLocation robot wooden_desk))
        (not (atLocation robot wooden_nightstand))
        (not (atLocation robot cd))
        (not (atLocation robot lamp))
    )
    (:goal
        (and
            (atLocation robot lamp)
            (holds robot cd)
        )
    )
)