(define (problem put_chilled_plate_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        plate - object
        table - object
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (inReceptacle plate fridge)
        (isCool plate)
        (not (atLocation robot fridge))
        (not (atLocation robot table))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle plate table)
        (isCool plate)
    ))
)