(define (problem look_at_box_by_lamp)
    (:domain put_task)
    (:objects
        agent1 - agent
        brown_cardboard_box - receptacle
        wooden_nightstand - receptacle
        wooden_table - receptacle
        lamp - object
        alarm_clock - object
        black_tablet - object
        yellow_bowl - object
        blue_object - object
        tennis_racket - object
        pencils - object
        glass_of_water - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable brown_cardboard_box)
        (openable wooden_nightstand)
        (openable wooden_table)
        (opened brown_cardboard_box)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle blue_object brown_cardboard_box)
        (inReceptacle pencils wooden_nightstand)
        (inReceptacle glass_of_water wooden_nightstand)
        (inReceptacle alarm_clock wooden_table)
        (inReceptacle black_tablet wooden_table)
        (inReceptacle yellow_bowl wooden_table)
        (atLocation agent1 wooden_table) ; assuming agent starts near table as a reasonable default
    )
    (:goal
        (and
            (atLocation agent1 brown_cardboard_box)
            (atLocation agent1 lamp)
        )
    )
)