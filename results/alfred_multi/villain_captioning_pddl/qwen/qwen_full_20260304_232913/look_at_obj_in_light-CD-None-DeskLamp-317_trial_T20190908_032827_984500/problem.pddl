(define (problem inspect_cd_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        desk - receptacle
        nightstand - receptacle
        bowl - receptacle
        card - object
        tablet1 - object
        tablet2 - object
        cd - object
        lamp_base - object
        screwdriver - object
        table_lamp - object
    )
    (:init
        ; Locations: objects are on the desk or nightstand
        (atLocation robot desk)
        (inReceptacle bowl desk)
        (inReceptacle card desk)
        (inReceptacle tablet1 desk)
        (inReceptacle tablet2 desk)
        (inReceptacle cd desk)
        (inReceptacle lamp_base desk)
        (inReceptacle screwdriver desk)
        (inReceptacle table_lamp nightstand)

        ; Receptacles are not openable (as per scene, no indication they can be opened)
        ; No objects are held
        (not (holdsAny robot))

        ; No objects are clean, hot, cool, sliced, or toggled
        (not (isClean cd))
        (not (isHot cd))
        (not (isCool cd))
        (not (isSliced cd))
        (not (isOn table_lamp))
        (not (isToggled table_lamp))

        ; The table lamp is not a receptacle, so it doesn't have openable property
    )
    (:goal
        (and
            ; The robot must have picked up the CD
            (holds robot cd)
            ; The robot must have gone to the nightstand
            (atLocation robot nightstand)
            ; The table lamp must be turned on
            (isOn table_lamp)
            ; The CD is being inspected under the lamp light (implied by holding CD and lamp being on at nightstand)
        )
    )
)