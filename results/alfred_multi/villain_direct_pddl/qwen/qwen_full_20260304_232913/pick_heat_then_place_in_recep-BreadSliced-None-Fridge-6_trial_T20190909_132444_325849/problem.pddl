(define (problem cook_and_chill_bread)
    (:domain put_task)
    (:objects
        robot - agent
        bread - object
        knife - knife
        microwave - microwave
        fridge - fridge
        countertop - receptacle
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle bread countertop)
        (inReceptacle knife countertop)
        (openable microwave)
        (openable fridge)
        (not (opened microwave))
        (not (opened fridge))
        (not (holdsAny robot))
        (not (isSliced bread))
        (not (isHot bread))
        (not (isCool bread))
    )
    (:goal
        (and
            (isSliced bread)
            (isHot bread)
            (isCool bread)
        )
    )
)