(define (problem put_glass_and_knife_on_shelf)
    (:domain put_task)
    (:objects
        robot - agent
        knife - knife
        glass - receptacle
        countertop - receptacle
        cabinet_left - receptacle
        cabinet_right - receptacle
        microwave - receptacle
        bread - object
        egg - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation robot countertop))
        (not (atLocation robot cabinet_left))
        (not (atLocation robot cabinet_right))
        (not (atLocation robot microwave))

        ; Objects are on the countertop
        (atLocation robot countertop) ; Assuming robot starts near countertop for simplicity, or it can go there
        (atLocation knife countertop)
        (atLocation glass countertop)
        (atLocation bread countertop)
        (atLocation egg countertop)

        ; Receptacles are openable
        (openable microwave)
        (openable cabinet_left)
        (openable cabinet_right)

        ; Receptacles are not opened
        (not (opened microwave))
        (not (opened cabinet_left))
        (not (opened cabinet_right))

        ; Agent is not holding anything
        (not (holdsAny robot))

        ; Objects are not in any receptacle
        (not (inReceptacle knife countertop))
        (not (inReceptacle glass countertop))
        (not (inReceptacle bread countertop))
        (not (inReceptacle egg countertop))

        ; Objects are not cleaned, heated, cooled, sliced, or toggled
        (not (isClean knife))
        (not (isClean glass))
        (not (isHot knife))
        (not (isHot glass))
        (not (isCool knife))
        (not (isCool glass))
        (not (isSliced knife))
        (not (isSliced glass))
        (not (isOn microwave))
        (not (isToggled microwave))
    )
    (:goal
        (and
            ; The knife is in one of the cabinets (shelf)
            (inReceptacle knife cabinet_left)
            ; The glass is in one of the cabinets (shelf)
            (inReceptacle glass cabinet_right)
        )
    )
)