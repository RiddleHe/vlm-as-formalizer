(define (problem pick_pillow_and_turn_on_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        pillow - object
        lamp - object
        end_table - object
        armchair - object
        sofa - object
    )
    (:init
        (atLocation robot end_table) ; Assuming robot starts near the end table for efficiency
        (not (holdsAny robot))
        (not (isOn lamp))
        (not (isToggled lamp))
        (not (holds robot pillow))
        (not (atLocation robot pillow))
        (not (atLocation robot lamp))
        ; Pillow is on the armchair
        (atLocation pillow armchair)
        ; Lamp is on the end table
        (atLocation lamp end_table)
    )
    (:goal (and
        (holds robot pillow)
        (isOn lamp)
    ))
)