(define (problem get_ring_and_turn_on_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_table - receptacle
        lamp_base - receptacle
        brown_watch - object
        beige_statue - object
        lamp_shade - object
    )
    (:init
        (inReceptacle beige_statue lamp_base)
        (inReceptacle brown_watch wooden_table)
        (not (atLocation robot wooden_table))
        (not (atLocation robot lamp_base))
        (not (atLocation robot lamp_shade))
        (not (holdsAny robot))
        (not (isOn lamp_shade))
        (not (isToggled lamp_shade))
    )
    (:goal (and
        (holds robot brown_watch)
        (isOn lamp_shade)
        (isToggled lamp_shade)
    ))
)