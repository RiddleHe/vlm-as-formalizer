(define (problem put_plate_with_keys_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        plate - object
        keys - object
        table - object
    )
    (:init
        (atLocation agent1 table)
        (not (holdsAny agent1))
        (not (holds agent1 plate))
        (not (holds agent1 keys))
        (not (inReceptacle plate table))
        (not (inReceptacle keys table))
        (not (isSliced plate))
        (not (isSliced keys))
        (not (isClean plate))
        (not (isClean keys))
        (not (isHot plate))
        (not (isHot keys))
        (not (isCool plate))
        (not (isCool keys))
        (not (isOn plate))
        (not (isOn keys))
        (not (isToggled plate))
        (not (isToggled keys))
    )
    (:goal (and
        (atLocation agent1 table)
        (not (holdsAny agent1))
        (not (holds agent1 plate))
        (not (holds agent1 keys))
        (not (inReceptacle plate table))
        (not (inReceptacle keys table))
    ))
)