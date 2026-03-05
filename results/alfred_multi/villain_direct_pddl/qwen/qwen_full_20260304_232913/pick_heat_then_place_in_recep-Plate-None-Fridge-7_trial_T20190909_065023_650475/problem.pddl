(define (problem put_heated_plate_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        grey_plate - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (atLocation robot microwave)
        (isOn microwave)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle grey_plate fridge)
            (isHot grey_plate)
        )
    )
)