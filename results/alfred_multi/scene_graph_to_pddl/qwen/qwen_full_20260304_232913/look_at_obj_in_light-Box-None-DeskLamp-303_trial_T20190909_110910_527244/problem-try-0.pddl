(define (problem look_at_box_by_lamp)
    (:domain put_task)
    (:objects
        agent
        brown_cardboard_box
        wooden_nightstand
        wooden_table
        lamp
        clock
        tablet
        pencil
        cup
        blue_object
        tennis_racket
    )
    (:init
        (openable brown_cardboard_box)
        (openable wooden_nightstand)
        (openable wooden_table)
        (opened brown_cardboard_box)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle pencil wooden_nightstand)
        (inReceptacle cup wooden_nightstand)
        (inReceptacle clock wooden_table)
        (inReceptacle tablet wooden_table)
        (inReceptacle blue_object brown_cardboard_box)
        (atLocation agent brown_cardboard_box)
    )
    (:goal (and
        (atLocation agent brown_cardboard_box)
        (isOn lamp)
    ))
)