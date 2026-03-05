(define (problem put_box_on_chair)
    (:domain put_task)
    (:objects
        robot - agent
        cardboard_box - object
        green_chair - object
        wooden_table - object
        microwave - microwave
        fridge - fridge
        sink - sink
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation robot cardboard_box))
        (not (atLocation robot green_chair))
        (not (atLocation robot wooden_table))
        (not (atLocation robot microwave))
        (not (atLocation robot fridge))
        (not (atLocation robot sink))

        ; Box is on the wooden table (not in a receptacle)
        (atLocation wooden_table cardboard_box)

        ; Green chair is not a receptacle, so no openable/opened predicates apply
        ; No object is held by agent
        (not (holdsAny robot))

        ; No cleaning, heating, cooling, slicing, or toggling has occurred
        (not (isClean cardboard_box))
        (not (isHot cardboard_box))
        (not (isCool cardboard_box))
        (not (isSliced cardboard_box))
        (not (isToggled cardboard_box))

        ; Receptacles are not opened initially (if applicable)
        (not (opened microwave))
        (not (opened fridge))
        (not (opened sink))

        ; Receptacles are openable
        (openable microwave)
        (openable fridge)
        (openable sink)
    )
    (:goal
        ; Goal: Put cardboard box on green chair
        ; Note: This is impossible under current domain since green_chair is not a receptacle
        ; and no action exists to place object on non-receptacle
        (inReceptacle cardboard_box green_chair)
    )
)