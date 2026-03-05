(define (problem place_towels_in_bathtub)
    (:domain put_task)
    (:objects
        robot - agent
        bathtub - receptacle
        sink - receptacle
        towel1 towel2 - object
        towel_ring1 towel_ring2 - object
    )
    (:init
        (atLocation robot sink) ; Assuming robot starts near the sink for practicality
        (inReceptacle towel1 towel_ring1)
        (inReceptacle towel2 towel_ring2)
        (not (holdsAny robot))
        (not (opened bathtub)) ; Bathtub is not openable, but included for consistency
        (not (opened sink))
        (not (isClean towel1))
        (not (isClean towel2))
        (not (isHot towel1))
        (not (isHot towel2))
        (not (isCool towel1))
        (not (isCool towel2))
        (not (isOn towel1))
        (not (isOn towel2))
        (not (isToggled towel1))
        (not (isToggled towel2))
        (not (isSliced towel1))
        (not (isSliced towel2))
    )
    (:goal (and
        (inReceptacle towel1 bathtub)
        (inReceptacle towel2 bathtub)
    ))
)