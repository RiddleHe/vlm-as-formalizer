(define (problem put_cold_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        tomato1 - object
        knife1 - knife
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (openable sink1)
        (not (opened microwave1))
        (not (opened fridge1))
        (not (opened sink1))
        (not (holdsAny agent1))
        (not (isClean tomato1))
        (not (isHot tomato1))
        (not (isCool tomato1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (isSliced tomato1))
        (atLocation agent1 microwave1) ; Assuming agent starts near microwave for simplicity
        (inReceptacle tomato1 fridge1) ; Tomato is initially in the fridge
    )
    (:goal
        (and
            (inReceptacle tomato1 microwave1)
            (isCool tomato1)
        )
    )
)