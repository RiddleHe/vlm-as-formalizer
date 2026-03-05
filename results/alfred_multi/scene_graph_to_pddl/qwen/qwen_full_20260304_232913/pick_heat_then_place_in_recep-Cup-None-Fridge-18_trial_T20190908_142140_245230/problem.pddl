(define (problem put_microwaved_cup_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        lettuce - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (inReceptacle knife sink)
        (inReceptacle lettuce sink)
        (not (opened microwave))
        (not (opened fridge))
        (not (holdsAny robot))
        (not (isHot lettuce))
        (not (isCool lettuce))
        (not (isClean lettuce))
        (not (isSliced lettuce))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (atLocation robot microwave))
        (not (atLocation robot fridge))
        (not (atLocation robot sink))
    )
    (:goal
        (and
            (inReceptacle lettuce fridge)
            (isHot lettuce)
        )
    )
)