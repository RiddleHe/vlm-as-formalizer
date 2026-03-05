(define (problem cook_and_chill_bread)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        bread - object
        knife - knife
    )
    (:init
        (openable microwave)
        (openable fridge)
        (not (opened microwave))
        (not (opened fridge))
        (not (isSliced bread))
        (not (isHot bread))
        (not (isCool bread))
        (not (holdsAny robot))
        (not (atLocation robot microwave))
        (not (atLocation robot fridge))
        (not (atLocation robot bread))
        (not (atLocation robot knife))
        (atLocation robot countertop) ; assuming a default starting point not specified, but robot must start somewhere
    )
    (:goal (and
        (isSliced bread)
        (isHot bread)
        (isCool bread)
    ))
)