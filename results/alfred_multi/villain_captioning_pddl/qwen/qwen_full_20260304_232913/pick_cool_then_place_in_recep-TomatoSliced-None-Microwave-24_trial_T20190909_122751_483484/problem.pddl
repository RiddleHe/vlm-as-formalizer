(define (problem put_cold_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        tomato1 - object
        knife1 - knife
        spoon1 - object
        fork1 - object
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (not (opened microwave1))
        (not (opened fridge1))
        (not (isCool tomato1))
        (not (isHot tomato1))
        (not (isOn microwave1))
        (inReceptacle tomato1 microwave1)
        (inReceptacle spoon1 sink1)
        (inReceptacle fork1 sink1)
        (atLocation agent1 knife1) ; Assuming agent starts near the knife as a plausible starting point
    )
    (:goal (and
        (inReceptacle tomato1 microwave1)
        (isCool tomato1)
    ))
)