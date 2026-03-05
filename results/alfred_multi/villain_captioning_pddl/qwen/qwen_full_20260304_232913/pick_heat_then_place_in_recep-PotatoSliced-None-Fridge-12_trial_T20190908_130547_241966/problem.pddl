(define (problem cook_potato_slice)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
        potato1 - object
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (openable sink1)
        (not (opened microwave1))
        (not (opened fridge1))
        (not (opened sink1))
        (inReceptacle potato1 microwave1)
        (not (isHot potato1))
        (not (isSliced potato1))
        (not (isCool potato1))
        (not (isClean potato1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (isOn fridge1))
        (not (isToggled fridge1))
        (not (isOn sink1))
        (not (isToggled sink1))
        (atLocation agent1 microwave1) ; agent starts near microwave for efficiency
    )
    (:goal (and
        (inReceptacle potato1 fridge1)
        (isHot potato1)
        (isSliced potato1)
    ))
)