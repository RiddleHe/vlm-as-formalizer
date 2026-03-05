(define (problem place_cooled_cup_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        cup - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (atLocation robot microwave) ; assuming robot starts near microwave for simplicity
        (not (holdsAny robot))
        (not (isCool cup))
        (not (isHot cup))
        (not (isOn microwave))
        (not (opened microwave))
        (not (opened fridge))
    )
    (:goal (and
        (inReceptacle cup microwave)
        (isCool cup)
    ))
)