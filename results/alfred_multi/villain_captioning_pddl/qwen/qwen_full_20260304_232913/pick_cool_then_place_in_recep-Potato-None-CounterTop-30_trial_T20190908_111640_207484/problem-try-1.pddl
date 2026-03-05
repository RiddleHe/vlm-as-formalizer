(define (problem put_chilled_potato_on_island)
    (:domain put_task)
    (:objects
        agent - agent
        fridge - fridge
        microwave - microwave
        sink - sink
        potato - object
        knife - knife
        bread - object
        brussels_sprout - object
        cup - object
        salt_shaker - object
        island - object  ; The countertop is treated as a location/object for "atLocation" and "inReceptacle" purposes.
    )
    (:init
        ; Initial locations: All objects are on the island (countertop) except appliances.
        (atLocation agent island) ; Agent starts at the island for simplicity, as it needs to interact with objects there first.
        (atLocation potato island)
        (atLocation knife island)
        (atLocation bread island)
        (atLocation brussels_sprout island)
        (atLocation cup island)
        (atLocation salt_shaker island)
        (atLocation microwave island) ; Microwave is on the countertop adjacent to the island, treated as being at the island location for movement.
        (atLocation fridge island)    ; Fridge is against the wall near the island, treated as being at the island location for movement.

        ; Receptacle properties
        (openable fridge)
        (openable microwave)
        ; Fridge is initially closed
        (not (opened fridge))
        ; Microwave is initially closed
        (not (opened microwave))

        ; Object states
        (not (isCool potato))
        (not (isHot potato))
        (not (isClean potato))
        (not (isSliced potato))
        (not (isOn microwave))
        (not (isOn fridge))

        ; Agent state
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle potato island)
        (isCool potato)
    ))
)