(define (problem put_plate_with_keys_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        table - receptacle
        plate - object
        keys - object
        smartphone - object
        monitor - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle plate table)
        (inReceptacle keys table)
        (inReceptacle smartphone table)
        (not (holdsAny robot))
        (not (opened table))
        (not (isClean plate))
        (not (isHot plate))
        (not (isCool plate))
        (not (isSliced plate))
        (not (isToggled plate))
        (not (isClean keys))
        (not (isHot keys))
        (not (isCool keys))
        (not (isSliced keys))
        (not (isToggled keys))
        (not (isClean smartphone))
        (not (isHot smartphone))
        (not (isCool smartphone))
        (not (isSliced smartphone))
        (not (isToggled smartphone))
        (not (isClean monitor))
        (not (isHot monitor))
        (not (isCool monitor))
        (not (isSliced monitor))
        (not (isToggled monitor))
    )
    (:goal
        (and
            (inReceptacle plate table)
            (inReceptacle keys plate)
        )
    )
)