(define (problem heat_apple_and_place)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        apple - object
        green_sponge - object
        table - object
    )
    (:init
        (atLocation robot table)
        (openable microwave)
        (openable sink)
        (not (opened microwave))
        (not (opened sink))
        (not (holdsAny robot))
        (not (isHot apple))
        (not (isClean apple))
        (not (isCool apple))
        (not (isSliced apple))
        (not (isOn microwave))
        (not (isToggled microwave))
        (inReceptacle apple table)
        (inReceptacle green_sponge table)
    )
    (:goal
        (and
            (isHot apple)
            (inReceptacle apple table)
            (atLocation robot table)
        )
    )
)