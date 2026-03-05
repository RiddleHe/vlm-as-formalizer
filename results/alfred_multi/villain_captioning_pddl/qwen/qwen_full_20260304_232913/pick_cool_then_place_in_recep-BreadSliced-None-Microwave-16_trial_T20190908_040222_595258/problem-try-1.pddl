(define (problem place_cooled_bread_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        bread1 bread2 - object
        knife - knife
        table - object
        countertop - object
        toaster - object
        tomato - object
        salt_shaker - object
        pepper_shaker - object
        paper_towels - object
        egg1 egg2 - object
        mug1 mug2 - object
        spoon - object
        book - object
        bottle - object
        cup - object
    )
    (:init
        ; Receptacles are openable
        (openable microwave)
        (openable fridge)
        ; Initial locations of objects
        (atLocation robot table) ; Assume robot starts at table for simplicity, though not specified
        (atLocation bread1 table)
        (atLocation bread2 table)
        (atLocation knife countertop)
        (atLocation microwave countertop) ; Microwave is mounted above countertop
        (atLocation fridge countertop) ; Fridge is on floor, but we'll treat its location as countertop for simplicity
        (atLocation toaster countertop)
        (atLocation tomato table)
        (atLocation salt_shaker table)
        (atLocation pepper_shaker table)
        (atLocation paper_towels table)
        (atLocation egg1 table)
        (atLocation egg2 table)
        (atLocation mug1 table)
        (atLocation mug2 table)
        (atLocation spoon table)
        (atLocation book table)
        (atLocation bottle table)
        (atLocation cup table)
        ; Initial states of objects
        (not (isSliced bread1))
        (not (isSliced bread2))
        (not (isHot bread1))
        (not (isHot bread2))
        (not (isCool bread1))
        (not (isCool bread2))
        (not (opened microwave))
        (not (opened fridge))
        (not (isOn microwave))
        (not (holdsAny robot))
        (not (isClean knife))
        (not (isClean bread1))
        (not (isClean bread2))
    )
    (:goal
        (and
            (inReceptacle bread1 microwave)
            (isCool bread1)
            (isSliced bread1)
        )
    )
)