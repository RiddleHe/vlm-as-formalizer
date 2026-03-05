(define (problem put_towels_in_bathtub)
    (:domain put_task)
    (:objects
        robot - agent
        bathtub - receptacle
        sink - receptacle
        towel1 - object
        towel2 - object
        towel_ring - object
    )
    (:init
        (atLocation robot towel_ring)
        (inReceptacle towel1 towel_ring)
        (inReceptacle towel2 towel_ring)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle towel1 bathtub)
            (inReceptacle towel2 bathtub)
        )
    )
)