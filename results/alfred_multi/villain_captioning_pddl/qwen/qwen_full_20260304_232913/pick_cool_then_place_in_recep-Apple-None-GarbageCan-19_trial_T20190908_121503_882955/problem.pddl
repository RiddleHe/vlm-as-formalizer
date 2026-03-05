(define (problem chill_apple_and_bin)
    (:domain put_task)
    (:objects
        agent1 - agent
        apple1 - object
        knife1 - object
        microwave1 - microwave
        fridge1 - fridge
        white_bin1 - sink
    )
    (:init
        (atLocation agent1 microwave1) ; Assuming agent starts near microwave as it's a central point
        (inReceptacle apple1 microwave1) ; Apple is on countertop near microwave, treated as in microwave for simplicity
        (inReceptacle knife1 microwave1) ; Knife is on countertop near microwave
        (openable microwave1)
        (openable fridge1)
        (not (opened microwave1))
        (not (opened fridge1))
        (not (isCool apple1))
        (not (isSliced apple1))
        (not (isHot apple1))
        (not (holdsAny agent1))
        (not (isClean apple1))
        (not (isOn microwave1))
        (not (isOn fridge1))
    )
    (:goal (and
        (inReceptacle apple1 white_bin1)
        (isCool apple1)
    ))
)